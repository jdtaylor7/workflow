# Embedded ARM Development

This document details how to enable ARM cross compilation. This applies to
Cygwin environments in Windows. This is necessary since the package for the ARM
g++ compiler is not available for Cygwin.

### Download GNU ARM Embedded Toolchain

Go to the relevant ARM Developer [download page](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) and install
the most recent "gcc-arm-none-eabi-<date>-major-win32.exe" file.

Run the installer. When specifying the destination folder, remove the
last directory which denotes the version of the toolchain.

Add the binary location to Cygwin's PATH by adding the following to `.bashrc`:
`PATH="$PATH:/cygdrive/c/Program Files (x86)/GNU Tools Arm Embedded/bin/"`.

### Download ST-LINK Tool

Go to ST's [download page](https://www.st.com/en/development-tools/stsw-link004.html) to install ST-LINK.

Extract the archive and run the installer. Install the executable to the default
directory and install necessary drivers if prompted.

Add the command line tool's path to Cygwin's PATH by adding the following to `.bashrc`:
`PATH="$PATH:/cygdrive/c/Program Files (x86)/STMicroelectronics/STM32 ST-LINK Utility/ST-LINK Utility"`.
