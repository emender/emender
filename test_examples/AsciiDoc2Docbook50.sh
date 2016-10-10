#!/bin/bash

# Example script that converts books from AsciiDoc format to the DocBook 5.0.

# Copyright (C) 2016 Pavel Tisnovsky <ptisnovs@redhat.com>

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

MASTER=master
rm -rf ${MASTER}

# Set if necessary
#export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk
asciidoctor -d book -b docbook -a nolang -r asciidoctor-diagram ${MASTER}.adoc
publican create --name=${MASTER}
cp ${MASTER}.xml ${MASTER}/en-US/${MASTER}.xml

cp ${MASTER}/publican.cfg ./
cp -r ${MASTER}/en-US ./

