Installation Instructions
=========================

This file documents how to install and uninstall Emender on GNU/Linux. For
a brief description of what the tool does and more information on how to
use it, read the file named *README.md*.

System Requirements
-------------------

The following are the minimum requirements for running Emender on your
system:

* POSIX-compliant operating system
* Lua 5.1 or newer

Installing Emender
------------------

To install Emender in the system, change to the directory with your local
copy of the source code and type the following at a shell prompt as the
*root* user:

    make install

This command installs the command line tool, related libraries, relevant
manual pages, and other documentation to the respective subdirectories in
the /usr/local/ directory.

To install Emender in a different installation directory, change the value
of the "prefix" variable on the command line. For example, to install
Emender to the ~/.local/ directory, type:

    make prefix=$HOME/.local install

Uninstalling Emender
--------------------

To uninstall Emender from the system, change to the directory with your
local copy of the source code and type the following at a shell prompt as
the *root* user:

    make uninstall

This command removes the command line tool, related libraries, relevant
manual pages, and other documentation from the respective subdirectories in
the /usr/local/ directory.

If you have installed Emender in a different installation directory, change
th value of the "prefix" variable on the command line. For example, to
uninstall Emender from the ~/.local/ directory, type:

    make prefix=$HOME/.local uninstall

Container
---------

You can run Emender as a container. You can either build your own container
based on the `Containerfile` configuration or use a prebuilt container
available from Quay.io. The container bundles all necessary dependencies.

The following instructions assume that the Podman tool is available on your
system. If you use Docker instead of Podman, replace `podman` with `docker`
in the commands.

* Run a prebuilt container:

    ```
    $ podman run -it -v .:/mnt:Z quay.io/msuchane/emender:latest emend
    ```

* Build the container locally:

    ```
    $ podman build -f Containerfile --tag=emender
    ```
