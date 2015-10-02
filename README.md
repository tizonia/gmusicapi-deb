# 'python-gmusicapi' Debian package

This is the source for the Tizonia project's Debian package of the
[gmusicapi](https://github.com/simon-weber/gmusicapi) Python library. It is in
no way specific to Tizonia and may also be used by other applications to gain
access to the Google Play Music streaming services.

The goal is to allow installation of Simon Weber's
[gmusicapi](https://github.com/simon-weber/gmusicapi) library, including all
its dependencies, using Debian's apt-get instead of 'pip'.

## Building the Debian package

1. Download the 'gmusicapi' git repo and install all the necessary Debian
   development packages. To do this, just run the supplied bootstrap script
   with a valid 'gmusicapi' git tag. E.g.:
   ```bash

        $ ./bootstrap.sh 7.0.0

   ```

2. Now run the usual autotools sequence to configure, build, install and
   uninstall the 'python-gmusicapi' Debian package.
   ```bash

        $ ./configure
        $ make
        $ make install
        $ make uninstall

   ```

## Pre-requisites

At the time of writing, 'gmusicapi' depends on two other Python libraries for
which there are no corresponding Debian packages available in the Debian or
Ubuntu repositories. These two Python libraries are:
- 'gpsoauth' : https://github.com/simon-weber/gpsoauth
- 'MechanicalSoup' : https://github.com/hickford/MechanicalSoup

These two libraries are similarly packaged by Tizonia. See:
- https://github.com/tizonia/gpsoauth-deb
- https://github.com/tizonia/mechanicalsoup-deb
