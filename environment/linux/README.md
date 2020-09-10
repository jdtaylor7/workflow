### Boot Firmware (BIOS or UEFI)

After POSTing and initializing hardware required for booting, UEFI systems read
boot entries in the NVRAM to determine which EFI applications to launch and
where they are located (disk and partition). An EFI application could be a boot
loader/manager (GRUB, rEFInd, etc.), the Arch kernel, a UEFI shell, etc.

Relevant Arch Linux wiki pages:
* [Arch boot process](https://wiki.archlinux.org/index.php/Arch_boot_process)
* [Dual boot with Windows](https://wiki.archlinux.org/index.php/Dual_boot_with_Windows)
* [Unified Extensible Firmware Interface](https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface)
* [EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)

##### Determine system boot firmware

If booted in UEFI mode, the following command will return the UEFI firmware
bitness:

```
cat /sys/firmware/efi/fw_platform_size
```

##### Find EFI system partition

`fdisk -l` lists all disks and their partition table type (GPT or MBR). If an
EFI partition exists, it should be listed as a partition on one of the disks
(would have type "EFI System" or "EFI (FAT-12/16/32)").

##### Create EFI partition

Follow instructions [here](https://wiki.archlinux.org/index.php/EFI_system_partition#Create_the_partition).

##### Mount EFI partition

Use [fstab](https://wiki.archlinux.org/index.php/Fstab).

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

##### Install a rEFInd theme

Next, we'll install a theme. Currently I'm just using Evan Purkhiser's
[rEFInd-minimal](https://github.com/EvanPurkhiser/rEFInd-minimal) theme with no
alterations. Follow the installation instructions on the Github repo.

##### Ensure boot loader is being used by motherboard

For my MSI board, follow [MSI docs](https://www.msi.com/support/technical_details/MB_Boot_Priority).
