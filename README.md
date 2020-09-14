dotfiles.git
=====

This repository contains configuration files for a number of programs
I use daily. It also contains some shell scripts I wrote or found on
the internet.

The files are organized into [GNU Stow][gnu-stow] packages, so you
should install it in order to make linking the files into your $HOME
easier. However, most of these files should work just fine if you copy
and paste them into your own configuration. (Be aware that some packages
are not fully self-contained, for example, the i3 configuration has binds
for scripts in the bin package.)

Also, you may run into some quirks running these configuration files on
non-Arch Linux distributions (It must be a pain to get termite running
on Debian, for example).

Other configurations
-----

See the zzz-others directory for configuration files that can't be
used as Stow packages.

License
-----

Some files in this repository were written by others, and have actual
attributions and/or licenses, which are kept intact from their original
source. Other files were written by me, and are either released under the
public domain, or are simply too trivial to do anything with them.

All other files should be configuration files, which you are free to
use in any way you want to, including copying, modifying, redistributing
and publishing.

[gnu-stow]: http://www.gnu.org/software/stow/
