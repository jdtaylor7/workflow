# Installing Jenkins on a server

* `sudo apt-get update && sudo apt-get upgrade`
* `sudo apt-get install openjdk-11-jre`
* "Installing Jenkins" on [this](https://www.techcoil.com/blog/how-i-setup-jenkins-on-my-raspberry-pi-3-with-raspbian-stretch-lite/)
    techcoil page:
    * `wget -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -`
    * `sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'`
    * `sudo apt-get update`
    * `sudo apt-get install jenkins`
    * Enable access logs
        * Edit `/etc/default/jenkins`
            * Above `JENKINS_ARGS`, add:
                ```
                # Enable access log
                JENKINS_ACCESSLOG="--accessLoggerClassName=winstone.accesslog.SimpleAccessLogger --simpleAccessLogger.format=combined --simpleAccessLogger.file=/var/log/jenkins/access.log"
                ```
            * Add `$JENKINS_ACCESSLOG` to `JENKINS_ARGS`
        * Edit `/etc/logrotate.d/jenkins`
            * Change `/var/log/jenkins/jenkins.log` to `/var/log/jenkins/*.log`
        * `sudo systemctl restart jenkins`
    * Change port by editing `/etc/default/jenkins`
        * `HTTP_PORT=8888`
        * `sudo systemctl restart jenkins`

# References

### Using Jenkins with Java 11 instead of Java 8
* [jenkins.io](https://jenkins.io/doc/administration/requirements/upgrade-java-guidelines/)
* [wiki.jenkins.io](https://wiki.jenkins.io/display/JENKINS/Access+Logging)

# Creating a basic Jenkins pipeline

# Creating a Jenkins webhook in a Github project
