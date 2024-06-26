QWERTY-Flip
===========

The better keyboard layout your fingers already know.

For information on what [QWERTY-Flip](https://nick-gravgaard.com/qwerty-flip/) is,
and why you might want to try it, see https://nick-gravgaard.com/qwerty-flip/

If you want to try QWERTY-Flip you can find the layout files for different
operating systems in this repo. It has these formats:
* Linux (XKB - [X Keyboard Extension](https://wiki.archlinux.org/index.php/X_keyboard_extension))
* Windows
    * KLC - [Microsoft Keyboard Layout Creator](https://www.microsoft.com/en-us/download/details.aspx?id=102134)
    * PKL - [Portable Keyboard Layout](http://pkl.sourceforge.net/)
    * AHK - [AutoHotkey](https://www.autohotkey.com/))
* Mac OS (keylayout)
* [TMK](https://github.com/tmk) firmware

These files are generated by the `generate.py` script. It reads the included GB
and US QWERTY JSON files (derived from
[this](https://github.com/39aldo39/klfc/blob/master/examples/qwerty.json)), moves
the keys to create QWERTY-Flip JSON files (as well as Spin, Twist, and Spin-Twist
variants), and then runs [klfc](https://github.com/39aldo39/klfc) to generate
keyboard layout files for Linux, Windows, Mac OS, and [TMK](https://github.com/tmk).
