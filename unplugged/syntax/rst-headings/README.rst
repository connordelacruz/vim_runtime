====================
RST-Headings for VIM
====================

This is a modified version of `rst-headings.vim
<https://github.com/tobyS/rst-headings.vim>`__.

This VIM plugin maintains RST (ReStructured Text) headings for you
automatically.

-----
Usage
-----

RST-Headings maintains both, under-lined and over-under-lined headings for you.
If you edit the text of an existing heading, you don't need to do anything at
all. RST-Headings simply takes care of the lines. If you want to start a new
heading, you can do that as follows:

Underlined
==========

To create an underlined heading, place the char (just a single one) you want to
use for that heading at the beginning of a line and start typing your text in
the line above like this::

    S_
    =

Where ``=`` is your character of choice for the heading, the ``S`` is your first
typed letter of the heading and ``_`` is your cursor. From now on, RST-Headings
will maintain your underline for you.

Under- and Overlined
====================

Headings with a line above and below it are as easy to create: Simply start
your heading char above the headline::

    =
    S_

In the moment you type the ``S``, RST-Headings will automatically create the
underline for you and from there on maintain your double lined heading for you.

-------
Install
-------

Installation works by your VIM plugin manager of choice. I use Vundle__ and
therefore add

__ https://github.com/gmarik/vundle

::

    Bundle "tobyS/rst-headings.vim"

to my ``.vimrc`` and run

::

    :BundleInstall

in my VIM.

-------------
Configuration
-------------

There is only a single config option::

    g:rsth_auto_register

Setting it to ``0`` will avoid RST-Headings registering its autocommand and
therefore disable it completely. If you still want to use it then, you can use
the only available function ``rsth#Heading()`` yourself.

..
   Local Variables:
   mode: rst
   fill-column: 79
   End: 
   vim: et syn=rst tw=79
