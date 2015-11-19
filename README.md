dotfiles.git
-----
This repository contains configuration files for a number of programs
I use daily. It also contains some shell scripts I wrote or found on
the internet.

You should have [GNU stow][gnu-stow] installed to link
these files to your $HOME.

Important patched packages
-----
* [rxvt-unicode-patched][urxvt-patch]
* [gtk3-typeahead][gtk3-ta]

Minor configurations
-----
For Firefox and derivatives: open about:config and set 
`browser.download.lastDir.savePerSite` as false (create the key
if necessary)

License
-----
Unless otherwise noted, you are free to use, modify, and redistribute
all files in this repository. Certain files may have some restrictions
on how you can do these things.

[gnu-stow]: http://www.gnu.org/software/stow/
[urxvt-patch]: https://aur.archlinux.org/packages/rxvt-unicode-patched
[gtk3-ta]: https://aur.archlinux.org/packages/gtk3-typeahead
