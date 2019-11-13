# Basic

### Add new user
* `sudo adduser <user>`
* `sudo groupadd sshlogin`
* `sudo usermod -a -G adm,sudo,users,netdev,shhlogin <user>`

### Make `sudo` require a password
* Edit `/etc/sudoers.d/010_pi-nopasswd`
    * `<user> ALL=(ALL) PASSWD: ALL`

### Automatically apply latest security updates
* `sudo crontab -e`
    * Add `0 0 * * * apt install openssh-server`
* *TODO add techniques from first vigilcode article?*

# SSH
* `sudo systemctl enable ssh`
* `sudo systemctl start ssh`
* Edit `/etc/ssh/sshd_config`
    * `AllowGroups sshlogin`
* `sudo systemctl restart ssh`
* Add ssh keys
    * From the client: `ssh-keygen`
    * Enter a passphrase if you would like, else leave the field empty
    * From the client: `ssh-copy-id <user>@<server_ip>`
* *Can now log in remotely*
* Edit `/etc/ssh/sshd_config` again
    * `ChallengeResponseAuthentication no`
    * Disallow password authentication: `PasswordAuthentication no`
    * `UsePAM no`
    * Disallow remote log in from root: `PermitRootLogin no`
    * `X11Forwarding no`
    * `UseDNS no`
* `sudo systemctl restart ssh`

# ufw (Uncomplicated Fire Wall)
* Alternative to `iptables`
* `sudo apt install ufw`
* ...
* `sudo ufw enable`
* `sudo ufw limit OpenSSH`
* Add any other applications (Jenkins here)
    * `sudo cp /etc/ufw/applications.d/openssh-server /etc/ufw/applications.d/jenkins-server`
    * Edit `/etc/ufw/applications.d/jenkins-server`
    ```
    [Jenkins]
    title=Jenkins server
    description=Jenkins is a CI/CD server
    ports=8888/tcp
    ```
    * `sudo ufw limit Jenkins`

# Enable email notifications

### Set up email server
* *Leaving this, but not implementing for now because it's fairly complicated and not a priority. Therefore, these instructions are incomplete*
* `sudo apt-get install postfix`
* GUI options:
    * Mail configuration: `Internet Site`
    * System mail name: `example.com`
    * Edit `/etc/postfix/main.cf`
        * `myhostname = mail.example.com`
        * `mydomain = example.com`
        * `myorigin = $mydomain`
        * `mydestination = $myhostname, localhost.$mydomain`, $mydomain, mail.$mydomain, www.$mydomain
        * `mail_spool_directory = /var/spool/mail`
        * `mynetworks = 127.0.0.0/8, <mail_server>`
        * `smtpd_banner = $myhostname ESMTP #mail_name (Raspbian)`
        * `inet_protocols = ipv4`
    * Configure `postfix` to route through a port other than 25 (default SMTP) to prevent traffic being blocked by ISPs
        * .
    * `sudo systemctl restart postfix`
* `sudo apt-get install mailutils`

### Install `logwatch`
* `sudo apt-get install logwatch`
* Edit `/usr/shared/logwatch/default.conf/logwatch.conf`
    * `Output = file`
    * `Filename = <file>`
    * `Detail = High`
* Running manually to test: `logwatch --detail Med --service all --range today --output file --filename ./test.log`
* Add script to run logwatch
    * `cd ~`
    * `mkdir scripts`
    * `vim scripts/logwatch_daily.sh`
        ```
        #!/bin/bash
        test -x /usr/share/logwatch/scripts/logwatch.pl || exit 0
        /usr/sbin/logwatch --output file --filename /path/to/logs/$(date +%Y_%m_%d)_logwatch.log
        ```
    * `chmod 777 scripts/logwatch_daily.sh`
* Update crontab to run custom script: `sudoedit /etc/cron.daily/00logwatch`
    ```
    #!/bin/bash
    /path/to/scripts/logwatch_daily.sh
    exit 0
    ```
* Test again by running `/path/to/scripts/logwatch_daily.sh`

# Fail2ban
* `sudo apt install fail2ban`
* Check version
    * `apt-cache policy fail2ban`
    * `Installed: <version>`
    * `<version>` must be >= `0.10.x`
    * If not, download an appropriate version from the [fail2ban website](http://www.fail2ban.org/wiki/index.php/Main_Page)
* `sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local`
* Add paths of Jenkins logs
    * Edit `/etc/fail2ban/paths-common.conf`
        ```
        jenkins_log = /var/log/jenkins/jenkins.log
        jenkins_access_log = /var/log/jenkins/access.log
        ```
* Edit `/etc/fail2ban/jail.local`
    * Set ban time
    ```
    [DEFAULT]
    # -1 is forever, else time in seconds
    bantime = -1
    ```
    * Enable for SSH
    ```
    [sshd]
    enabled = true
    banaction = ufw[application="OpenSSH"]
    port = 2222
    logpath = %(sshd_log)s
    backend = $(default_backend)s
    maxretry = 3
    ```
    * Enable for Jenkins
    ```
    [jenkins]
    enabled = true
    banaction = ufw[application="Jenkins"]
    port = 8888
    logpath = %(jenkins_access_log)s
    backend = $(default_backend)s
    maxretry = 3
    ```
    * Remove any duplicate entries if necessary
        * Remove `[sshd]` section if placing a new section at the top of the file
        * Remove `bantime` entry under `[DEFAULT]` section if placing at top of file
* Create filter for Jenkins
    * Create and edit `/etc/fail2ban/filters.d/jenkins.conf`
    * *As of now, don't think this is actually possible since Jenkins's access log doesn't seem to record when login attempts fail. Might investigate more later.*
* Edit `/etc/fail2ban/jail.d/defaults-debian.conf`
    ```
    [sshd]
    enabled = false
    ```

* `sudo systemctl restart fail2ban`

# AppArmor

# References

### raspberrypi.org
* [SSH (Secure Shell)](https://www.raspberrypi.org/documentation/remote-access/ssh/)
* [Passwordless SSH access](https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md#copy-your-public-key-to-your-raspberry-pi)
* [Securing your Raspberry Pi](https://www.raspberrypi.org/documentation/configuration/security.md)

### blog.vigilcode.com
* [Ubuntu Server Initial Security – Quick Secure Setup Part I](https://blog.vigilcode.com/2011/04/ubuntu-server-initial-security-quick-secure-setup-part-i/)
* [UFW with Fail2ban – Quick Secure Setup Part II](https://blog.vigilcode.com/2011/05/ufw-with-fail2ban-quick-secure-setup-part-ii/)
* [Using AppArmor – Quick Secure Setup Part III](https://blog.vigilcode.com/2011/06/using-apparmor-quick-secure-setup-part-iii/)

### Mail server
* [digitalocean.com: How to Install and Configure Postfix](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-on-ubuntu-16-04)
* [likegeeks.com: Install, Secure, Access and Configure Linux Mail Server (Postfix)](https://likegeeks.com/linux-mail-server/)
* [stauber.org: Setting Up Your Own Mail Server (Postfix, Dovecot, Mailutils)](https://www.stauber.org/index.php/2018/12/03/setting-up-your-own-mail-server-postfix-dovecot-mailutils/)
* [Linux King: Linux Mail Server Postfix Part I](https://www.youtube.com/watch?v=AEH7uuTnM3o)

### Logwatch
* [digitalocean.com: How To Install and Use Logwatch Log Analyzer and Reporter on a VPS](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-logwatch-log-analyzer-and-reporter-on-a-vps)
* [sohonetwork.blogspot.com: Logwatch output as file with date](https://sohonetwork.blogspot.com/2012/04/logwatch-output-as-file-with-date.html)

### Fail2ban
* [digitalocean.com: How Fail2Ban Works to Protect Services on a Linux Server](https://www.digitalocean.com/community/tutorials/how-fail2ban-works-to-protect-services-on-a-linux-server)
