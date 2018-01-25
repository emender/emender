# A makefile for Emender, a test automation framework for documentation
# Copyright (C) 2014, 2015 Jaromir Hradilek <jhradilek@redhat.com>

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
NAME     = emender
VERSION  = 0.0.1

# General settings:
SHELL    = /bin/sh
INSTALL  = /usr/bin/install -c
POD2MAN  = /usr/bin/pod2man
SRCS    := $(shell find src -name '*.lua' -type f -print)
SRCS    += $(shell find files schema -type f -print)
SRCS    += emend
DIRS     = $(addprefix $(datadir)/,$(shell find src files schema -type d -print))
MANS    := $(patsubst %.pod,%,$(shell find doc -name '*.pod' -type f -print))
DIRS    += $(patsubst doc/man%,$(mandir)%,$(shell find doc/man -type d -print))
DOCS     = AUTHORS ChangeLog COPYING INSTALL.md README.md

# Target directories:
prefix   = /usr/local
bindir  := $(prefix)/bin
datadir := $(prefix)/share/$(NAME)
docdir  := $(prefix)/share/doc/$(NAME)
mandir  := $(prefix)/share/man

# Helper functions. Do not edit these functions unless you really know what
# you are doing::
install_dirs  = $(INSTALL) -m $(2) -d $(1)
install_files = $(foreach file,$(1),$(INSTALL) -m $(3) $(file) $(addprefix $(2)/, $(file));)
install_mans  = $(foreach file,$(1),$(INSTALL) -m $(3) $(file) $(file:doc/man/%=$(2)/%);)
remove_dirs   = -rmdir $(shell printf "%s\n" $(1) | tac)
remove_files  = -rm -f $(addprefix $(2)/,$(1))
remove_mans   = -rm -f $(patsubst doc/man/%,$(2)/%,$(1))

# The following are the make rules. Do not edit the rules unless you really
# know what you are doing:
.PHONY: all
all: $(MANS)

.PHONY: install
install: $(MANS)
	@echo "Creating installation directories:"
	$(call install_dirs,$(DIRS) $(docdir) $(bindir),755)
	@echo "Installing data files:"
	$(call install_files,$(SRCS),$(datadir),644)
	@echo "Installing documentation:"
	$(call install_files,$(DOCS),$(docdir),644)
	@echo "Installing manual pages:"
	$(call install_mans,$(MANS),$(mandir),644)
	@echo "Installing the executable file:"
	printf "#!/bin/bash\nlua $(datadir)/emend \"\$$@\"" > $(bindir)/emend && chmod 755 $(bindir)/emend

.PHONY: uninstall
uninstall:
	@echo "Removing the executable file:"
	-rm -f $(bindir)/emend
	@echo "Removing data files:"
	$(call remove_files,$(SRCS),$(datadir))
	@echo "Removing documentation:"
	$(call remove_files,$(DOCS),$(docdir))
	@echo "Removing manual pages:"
	$(call remove_mans,$(MANS),$(mandir))
	@echo "Removing installation directories:"
	$(call remove_dirs,$(bindir) $(datadir) $(docdir) $(DIRS))

.PHONY: clean
clean:
	-rm -f $(MANS)

%.1: %.1.pod
	$(POD2MAN) --section=1 --center="$(NAME)" \
	                       --name="$(notdir $(basename $@))" \
	                       --release="Version $(VERSION)" $^ $@

%.3: %.3.pod
	$(POD2MAN) --section=3 --center="$(NAME)" \
	                       --name="$(notdir $(basename $@))" \
	                       --release="Version $(VERSION)" $^ $@

%.5: %.5.pod
	$(POD2MAN) --section=5 --center="$(NAME)" \
	                       --name="$(notdir $(basename $@))" \
	                       --release="Version $(VERSION)" $^ $@
