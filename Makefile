# A makefile for Emender, a test automation framework for documentation
# Copyright (C) 2014 Jaromir Hradilek <jhradilek@redhat.com>

# This program is  free software:  you can redistribute it and/or modify it
# under  the terms  of the  GNU General Public License  as published by the
# Free Software Foundation, version 3 of the License.
#
# This program  is  distributed  in the hope  that it will  be useful,  but
# WITHOUT  ANY WARRANTY;  without  even the implied  warranty of MERCHANTA-
# BILITY  or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
# License for more details.
#
# You should have received a copy of the  GNU General Public License  along
# with this program. If not, see <http://www.gnu.org/licenses/>.

# General information about the project:
NAME    = emender
VERSION = 0.0.1

# General settings:
SHELL   = /bin/sh
INSTALL = /usr/bin/install -c
POD2MAN = /usr/bin/pod2man
SRCS    = $(addprefix doc/man/, man1/emend.pod man3/emender.pod)
MANS    = $(addprefix doc/man/, man1/emend.1 man3/emender.3)
DOCS    = AUTHOR ChangeLog COPYING INSTALL.md README.md

# Target directories:
prefix  = /usr/local
bindir  = $(prefix)/bin
docdir  = $(prefix)/share/doc/$(NAME)
mandir  = $(prefix)/share/man
man1dir = $(mandir)/man1
man3dir = $(mandir)/man3

# The following are the make rules. Do not edit the rules unless you really
# know what you are doing:
.PHONY: all
all: $(MANS)

.PHONY: clean
clean:
	-rm -f $(MANS)

%.1: %.pod
	$(POD2MAN) --section=1 --center="Emender" \
	                       --name="$(notdir $(basename $^))" \
	                       --release="Version $(VERSION)" $^ $@

%.3: %.pod
	$(POD2MAN) --section=3 --center="Emender" \
	                       --name="$(notdir $(basename $^))" \
	                       --release="Version $(VERSION)" $^ $@
