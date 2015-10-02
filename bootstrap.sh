#!/bin/bash
#
# Copyright (C) 2011-2015 Aratelia Limited - Juan A. Rubio
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#
# Bootstrap script to run the various commands required to install
# dependencies and bring the source tree into a state where the user
# can build and install the Debian package for the 'gmusicapi'
# Python library (see https://github.com/simon-weber/gmusicapi)
# using the usual sequence:
#
# $ configure
# $ make
# $ make install
#

exit_code=0

function check_dependency {
    local result=$(dpkg-query -W -f='${Status} ${Version}\n' "$1" 2> /dev/null | cut -d ' ' -f3)
    if [[ "$result" != "installed" ]]; then
        echo "[NOK] Installing now : $1."
        sudo apt-get -qq -y install "$1"
        if [[ $? -ne 0 ]]; then
            echo "Error while installing dependency $1."
            exit 1
        fi
    else
        echo "[ OK] $1 installed."
    fi
}

CWD=$(pwd)

if [[ "$#" -eq 0 || "$#" -gt 1 ]]; then
    echo "Please provide the gmusicapi's git tag to be packaged."
    echo "e.g.: $0 7.0.0"
    exit 1
fi

tag="$1"

# Verify that the supplied tag looks like a valid tag
echo "$tag" | grep -P -q '^(\d.){2}\d$'
if [[ $? -ne 0 ]];  then
    echo "Invalid git tag supplied."
    exit 1
fi

# Clone or update the gmusicapi repo
echo
echo "-----------------------------------------------------------"
echo "Cloning/updating gmusicapi's repo"
echo "-----------------------------------------------------------"
echo
if [[ ! -e "gmusicapi" ]]; then
    git clone https://github.com/simon-weber/gmusicapi/ && cd gmusicapi
    exit_code=$?
else
    echo "gmusicapi clone exists; checking for changes."
    cd gmusicapi && git pull origin master
    exit_code=$?
fi

if [[ $exit_code -ne 0 ]]; then
    echo "Error while cloning/updating the gmusicapi repo."
    exit 1
fi

# Checkout the supplied tag
echo
echo "-----------------------------------------------------------"
echo "Checking out git tag : $tag"
echo "-----------------------------------------------------------"
echo
git checkout tags/"$tag"
if [[ $? -ne 0 ]]; then
    echo "Error while checking out tag $tag."
    exit 1
fi

# Patch known issues in gmusicapi sources
if [[ "$tag" == "7.0.0" ]]; then
    sed -i '/ndg-httpsclient/d' setup.py
    sed -i '/ndg-httpsclient/d' requirements.txt
fi

cd "$CWD"

# Install/verify dependencies
echo
echo "-----------------------------------------------------------"
echo "Intalling/verifying dependencies"
echo "-----------------------------------------------------------"
echo
# This scripts' dependencies
check_dependency autoconf
check_dependency devscripts
check_dependency python-stdeb
for module in $(grep -Po '(?<=needs )python-\w*' configure.ac); do
    check_dependency "$module"
done

echo
echo "-----------------------------------------------------------"
echo "Generating/updating the configure script"
echo "-----------------------------------------------------------"
echo
autoreconf -ifs

echo
echo "Done configuring gmusicapi-deb."

echo
echo "-----------------------------------------------------------"
echo "Now type './configure && make' to build the debian package."
echo "-----------------------------------------------------------"
