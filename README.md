Emender
=======

In many respects, typical product documentation is similar to computer
software: it has source code, follows a certain life cycle, and has high
quality requirements. And just like modern software, it is often quite complex
and difficult to maintain. Fortunately, the fact that this documentation is
typically written in a semantic markup language makes it possible to parse the
documents and automate some tasks authors would otherwise have to perform
manually.

> **emend** verb [T] — to revise and correct a piece of writing before it
> is printed
>
> **emender** noun [C] — one who emends

**Emender** is a test automation framework tailored specifically for product
documentation written in XML. It not only makes it easy for individual authors
to develop custom tests for their documentation, but is also distributed with a
standard set of universally applicable tests.


Features
--------

* Designed specifically for product documentation written in XML.
* Built-in support for documents written in DocBook and Mallard.
* Written in Lua 5.2.


Example Usage
-------------

To run all tests located in the **./test/** directory and print the results to
standard output, type the following at a shell prompt:

    $ emend

To run only a selected test, specify it on the command line as follows:

    $ emend test/check_packages.lua

To print a list of available tests to standard output, type:

    $ emend --list


License
-------

Emender is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation; version 3 of the License.

Emender is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the [GNU General Public
License](http://www.gnu.org/licenses/) for more details.
