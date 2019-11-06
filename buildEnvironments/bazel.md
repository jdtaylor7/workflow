# Installing Bazel on Windows

Start by referring to the ["Installing Bazel on Windows"](
    https://docs.bazel.build/versions/master/windows.html) page.

Goal is to use Bazel with Cygwin, not sure if that will be possible yet.

Enable developer mode on Windows 10 by following [this article](
    https://www.howtogeek.com/292914/WHAT-IS-DEVELOPER-MODE-IN-WINDOWS-10/).

Installation of "Visual C++ Redistributable for Visual Studio 2015" failed
because of newer version (in this case, 2017) was already installed on my
machine. Skip installation of the older version for now.

Rename the Bazel binary to "bazel.exe".

Skip the optional step 4 of configuring output directories.

Put Bazel binary in /cygdrive/c/Program Files (x86)/Bazel/.

Add Bazel binary to Cygwin path:
    `PATH="$PATH:/cygdrive/c/Program\ Files\ \(x86\)/Bazel/"`.

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
    from there.

Download and install [Visual C++ Build Tools](
    https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2017).
    Do not install all of Visual Studio.

Things to install within Visual Studio Build Tools 2019:
* Workloads
    * Windows
        * C++ build tools
    * Installation details
        * C++ build Tools
            * MSVC v142 - VS 2019 C++ x64/x86 build Tools
            * Windows 10 SDK (newest version)
            * Testing tools core features - Build Tools


# Testing Installation

Download the [Bazel Github repo](https://github.com/bazelbuild/bazel.git).

Navigate to the bazel directory.

### Testing C++

Build the example project with `bazel build //examples/cpp:hello-world`.

Run the example project with `bazel-bin/examples/cpp/hello-world.exe`.
