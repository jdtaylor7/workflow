### Boot Loader

Replace GRUB with rEFInd because it's more aesthetic.

##### Install rEFInd

Download rEFInd package and install it.

* `pacman -S refind`
* `refind-install`

The above commands may be sufficient depending on your hardware. If so, rEFInd
should be working. There is more to do, however.

##### Remove GRUB

Now that rEFInd is installed we not longer need GRUB.

* `efibootmgr --verbose` to determine the GRUB boot entry. It's the entry with
file "grubx64.efi" or something similar. If the entry is "Boot002", then the
entry number is "2".
* `efibootmgr -b <grub boot entry number> -B` to remove the GRUB boot entry.
* Remove relevant GRUB directories since they aren't tracked by the pacman
package.
    * `rm -rf /boot/grub`
    * Remove the directory for the boot entry, could be one of the following
        * `/boot/efi/EFI/GRUB`
        * `/boot/efi/EFI/Manjaro/` (this was the directory on my system)
* Uninstall GRUB: `pacman -Rs grub`

##### Install a rEFInd theme.

Next, we'll install a theme. Currently I'm just using Evan Purkhiser's
[rEFInd-minimal](https://github.com/EvanPurkhiser/rEFInd-minimal) theme with no
alterations. Follow the installation instructions on the Github repo.
