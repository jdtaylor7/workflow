# Installing Bazel on Windows

Start by referring to the ["Installing Bazel on Windows"](
    https://docs.bazel.build/versions/master/windows.html) page alongside this
page.

Goal is to use Bazel with Cygwin, so do not install MSYS2 or resort to using
    Command Prompt or PowerShell.

On Windows, go to "Add or Remove Programs" and look for "Microsoft Visual C++
    Redistributable for Visual Studio 2015" or newer. If installed, skip
    installation.

Download the Bazel binary from Github and rename the Bazel binary to
    "bazel.exe".

Move Bazel binary to `/cygdrive/c/Program Files (x86)/Bazel/`.

Add Bazel binary to Cygwin path by adding the following to `.bashrc`:
    `PATH="$PATH:/cygdrive/c/Program Files (x86)/Bazel/"`.

Skip the optional step 4 of configuring output directories.

In step 5, installing optional compilers and language runtimes, do the
following:
* Do not install MSYS2 (at least not yet)
* Install the "common MSYS2 packages" in Cygwin
    * zip
    * unzip
    * patch
    * diffutils
    * git
* Do not install "Build Tools for Visual Studio 2019" (yet)
* Do not install Java SE Development Kit 10 (JDK)
* Do not install Python 2.7

Now refer to the [Using Bazel on Windows](
    https://docs.bazel.build/versions/master/windows.html) page and proceed
    from the "Build C++ with MSVC" section.

Download and install [Visual C++ Build Tools](
    https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2017).
    Do not install all of Visual Studio.

Things to install within Visual Studio Build Tools 2019:
* Workloads
    * Windows
        * C++ build tools --> Installation details --> C++ build tools
            * MSVC v142 - VS 2019 C++ x64/x86 build Tools
            * Windows 10 SDK (newest version)
            * Testing tools core features - Build Tools

Ensure an environment variable is set up to specify the location of the
Microsoft Visual Studio Build Tools. The following line should be present in
`.bazelrc`:

`build:windows --action_env BAZEL_VS="/cygdrive/c/Program Files(x86)/Microsoft Visual Studio/2019/BuildTools"`


# Testing Initial Installation

Download the [Bazel Github repo](https://github.com/bazelbuild/bazel.git).

Navigate to the bazel directory.

### Testing C++

Build the example project with `bazel build //examples/cpp:hello-world`.

Run the example project with `bazel-bin/examples/cpp/hello-world.exe`.

# Adding GCC and Clang Support

### GCC

### Clang

# Enabling Runfiles

If wanting to use the `--enable_runfiles` command on Windows, Windows developer mode must be enabled.

Enable developer mode on Windows 10 by following [this article](
    https://www.howtogeek.com/292914/WHAT-IS-DEVELOPER-MODE-IN-WINDOWS-10/).

# `.bazelrc`

An example `.bazelrc` file is included in this directory.

Note: In order to run lines such as `bazel:<name>...`, a config must be
specified when running `bazel build...` or `bazel test...` on the command line
with the `--config=<name>` flag. This is detailed in the Bazel docs [here](https://docs.bazel.build/versions/master/guide.html#bazelrc).
