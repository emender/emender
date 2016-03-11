#!/bin/bash

# Example script that converts books from AsciiDoc format to the DocBook 5.0.

MASTER=master
rm -rf ${MASTER}

# Set if necessary
#export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk
asciidoctor -d book -b docbook -a nolang -r asciidoctor-diagram ${MASTER}.adoc
publican create --name=${MASTER}
cp ${MASTER}.xml ${MASTER}/en-US/${MASTER}.xml

cp ${MASTER}/publican.cfg ./
cp -r ${MASTER}/en-US ./

