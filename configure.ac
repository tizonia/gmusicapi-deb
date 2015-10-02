# Copyright (C) 2011-2015 Aratelia Limited - Juan A. Rubio
#
# This file is part of Tizonia
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

AC_PREREQ([2.67])
AC_INIT([python-gmusicapi], [7.0.0], [juan.rubio@aratelia.com])
AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([foreign color-tests silent-rules -Wall -Werror])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET

# Checks for libraries.
AM_PATH_PYTHON([2.7])
AX_PYTHON_MODULE(sphinx, [gmusicapi needs python-sphinx])
AX_PYTHON_MODULE(validictory, [gmusicapi needs python-validictory >= 0.8.0])
AX_PYTHON_MODULE(decorator, [gmusicapi needs python-decorator >= 3.3.1])
AX_PYTHON_MODULE(mutagen, [gmusicapi needs python-mutagen >= 1.18])
AX_PYTHON_MODULE(google.protobuf, [gmusicapi needs python-protobuf >= 2.4.1])
AX_PYTHON_MODULE(requests, [gmusicapi needs python-requests >= 1.1.0])
AX_PYTHON_MODULE(dateutil, [gmusicapi needs python-dateutil >= 1.3])
AX_PYTHON_MODULE(proboscis, [gmusicapi needs python-proboscis])
AX_PYTHON_MODULE(oauth2client, [gmusicapi needs python-oauth2client >= 1.1])
AX_PYTHON_MODULE(mock, [gmusicapi needs python-mock >= 0.7.0])
AX_PYTHON_MODULE(appdirs, [gmusicapi needs python-appdirs >= 1.1.0])
AX_PYTHON_MODULE(gpsoauth, [gmusicapi needs python-gpsoauth])
AX_PYTHON_MODULE(mechanicalsoup, [gmusicapi needs python-mechanicalsoup])
AX_PYTHON_MODULE(OpenSSL, [gpsoauth needs python-openssl])
AX_PYTHON_MODULE(pyasn1, [gmusicapi needs python-pyasn1])

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
