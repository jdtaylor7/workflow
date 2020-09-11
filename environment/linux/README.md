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

##### Consider dual-boot environment

**This is important.** If running a dual-boot system with Windows and Linux, the
whole process is much easier if you check the boot method of Windows at the
beginning. If your Windows environment boots in legacy BIOS mode, you'll want to
change it over to UEFI mode before proceeding with the Linux side of things.

Microsoft introduced a command-line tool in the Windows 10 Creators Update which
makes convert a Windows system from legacy BIOS to UEFI very simple. First, open
up the command prompt with Administrator privileges. Then, navigate to the
C:\\Windows\\System32 directory. This directory contains the MBR2GPT tool which
will automate this conversion process.

MBR2GPT converts two parts of the system, actually. As the name suggests it
first converts the specified disk partitioning scheme from MBR to GPT (we just
need to convert the C drive if that's where you boot from). Windows is strict
about disk partitioning and boot method combinations, requiring either
MBR/legacy BIOS OR GPT/UEFI. MBR cannot be used in UEFI mode and GPT cannot be
used in legacy BIOS mode.

The second part of the system MBR2GPT converts is the boot method. It does so by
creating an EFI partition on the drive.

As for actually running the tool, first validate the disk to check for potential problems:

```
mbr2gpt /validate /allowFullOS
```

If no errors are emitted, run the conversion process:

```
mbr2gpt /convert /allowFullOS
```

The `/allowFullOS` option is required when running the tool in a live Windows
environment. The tool is by default meant to run in a Windows Preinstallation
Environment, but running in a live system is fine when this option is used.

If you check the C drive's partition scheme, it should be updated to GPT. The
boot method is still legacy BIOS but will be updated to UEFI once the system is
rebooted. While the system is rebooted, open your system's firmware settings and
change the *firmware's* boot mode from legacy BIOS to UEFI (if an option is
available which supports both, this is fine too).

We now have an EFI partition on our Windows drive. At this point there could be
a few different situations, assuming you are dual-booting Windows and Linux:

* The Windows and Linux systems are on the same drive and an EFI partition
already existed for your Linux system. In this case Windows should have
skipped  creating the EFI partition since only one of these partitions should
exist per  disk. The disk partitioning scheme should also be converted to GPT,
though I'm  not sure how this affects the existing Linux system using MBR
since I used separate disks.

* The Windows and Linux systems are on the same drive and no EFI partition
existed before using the `mbr2gpt` tool. The EFI partition will have been
created as mentioned above, though again I don't know how the changed
partition  scheme would affect an adjacent Linux system.

* Windows/Linux on separate drives, an EFI partition already existed on the
Linux drive. This was my situation since I didn't do this Windows conversion
before installing rEFInd. This is fine, since one EFI partition can exist per
disk, but you may have to [reinstall
rEFInd](https://www.rodsbooks.com/refind/installing.html) afterwards if you do
it this way.

* Windows/Linux on separate drives, no EFI partition existed before using
`mbr2gpt`. You won't need to create an EFI partition on the Linux disk since a
single EFI partition per system is allowed.

##### Create EFI partition

**Note: If using rEFInd, it should be sufficient to just run rEFInd's install
process without manually changing EFI partitions. Check below at [Install
rEFInd](#install-refind).**

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

For my MSI board, follow [MSI
docs](https://www.msi.com/support/technical_details/MB_Boot_Priority).
