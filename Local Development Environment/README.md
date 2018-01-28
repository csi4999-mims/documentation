# Local Development Environment #

This guide is for the creation of a local
[CakePHP](https://cakephp.org/) development environment on Windows 10
(though it should work fine for other modern versions of Windows).

## Components ##

The tools we will be using for local development are as follows:

- [XAMPP](https://www.apachefriends.org)
- [Git Bash](https://git-scm.com/download/win)
- [Composer](https://getcomposer.org/)

## XAMPP Installation & Configuration ##

Grab a copy of the [XAMPP](https://www.apachefriends.org) installer,
and install it using the default options.  It should offer up a
suggested location of `C:\xampp`; if you change this location to
somewhere else, just change it accordingly in the following
instructions.

For CakePHP to work, we need to configure XAMPP's PHP to use the
`intl` extension, which is _included_, but not _enabled_ (see
[here](https://book.cakephp.org/3.0/en/installation.html) for more
details).  To enable it, open up `C:\xampp\php\php.ini` in your
favorite text editor, and uncomment the line with the following:

```conf
extension=php_intl.dll
```

If this line doesn't exist, just add it to the bottom of the file (or
wherever it makes sense to add it).

Once that's done, head over to the XAMPP Control Panel and
start/restart Apache for the changes to take effect.

<!-- insert picture of XAMPP Control Panel here -->

To test that Apache's working properly, just point your browser to
`localhost`.  You should see the default XAMPP welcome page.

<!-- insert picture of XAMPP welcome page -->


If you've been interacting with Git in Windows already, you probably
already have this installed.  This utility can also be used to create
ssh keys and share them with remote hosts, which may be useful for
interacting directly with the server.

<!-- I'm making this up as I go along, so bear with me.  This section
may not even be needed. -->

Troubleshooting
---------------

Bash is primarily a UNIX shell, and as such, is subject to most of the
UNIX trappings.  It typically looks to the environment variable `HOME`
for your home directory.  If you find that the ssh key you created in
the [Git Bash](#git-bash) section ends up not working for you, this
may be the culprit.  Just add an environment variable `HOME` which
points to your `C:\Users\Username` directory (obviously replacing
`Username` with your _actual username_).
## Git Bash ##

<!-- insert screenshot of the environment variables dialog window -->
