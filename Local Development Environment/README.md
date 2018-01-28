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

After XAMPP is installed, we need to configure PHP in order for
CakePHP to be happy.  The `intl` extension, which is needed by
CakePHP, is _included_ in XAMPP, but not _enabled_ (see
[here](https://book.cakephp.org/3.0/en/installation.html) for more
details).  To enable it, open up `C:\xampp\php\php.ini` in your
favorite text editor, and uncomment the line with the following:

```ini
extension=php_intl.dll
```

If this line doesn't exist, just add it to the bottom of the file (or
wherever it makes sense to add it).

Once that's done, head over to the XAMPP Control Panel and
start/restart Apache for the changes to take effect.

![Screenshot of the XAMPP Control
Panel](media/xampp-control-panel.png)

To test that Apache's working properly, just point your browser to
`localhost`.  You should see the default XAMPP welcome page.

![Screenshot of XAMPP's welcome page](media/xampp-welcome-page.png)

## Git Bash ##

If you've been using Git in Windows already, you probably already have
[Git Bash](https://git-scm.com/download/win) installed.  If you don't,
go ahead and install it, or use whatever [Git
front-end](https://git-scm.com/download/gui/windows) you prefer.  This
guide, however, will assume you are using Git Bash for Windows.  We'll
use it to clone the [Website](https://github.com/csi4999-mims/Website)
repository from GitHub.

If you have already been communicating with GitHub over ssh in Git
Bash, great; you can skip this paragraph!  If you haven't, you can
either share an ssh key that Git Bash knows about with GitHub or you
can use an https connection.  Using an https connection is perfectly
fine, it just may require you to enter your GitHub credentials each
time you interact with GitHub.  For more details on how to share an
SSH key with GitHub, please check out [this
article](https://help.github.com/articles/connecting-to-github-with-ssh/).

<!-- We may need to create a tutorial on how to create an ssh key in
Git Bash ond share it with GitHub.  For the time being, though, I'll
just point them to some other resources. -->

We'll need the `C:\xampp\htdocs` directory to be completely empty in
order to clone our repository into it.  Here are the commands you can
run in Git Bash to back up the current `htdocs` directory, clear it
out, then clone the repo.  If you want to use an https connection
instead of an ssh connection, just replace
`git@github.com:csi4999-mims/Website.git` with
`https://github.com/csi4999-mims/Website.git`.

```bash
cd /c/xampp
cp -a htdocs htdocs.orig
rm -rf htdocs/*
git clone git@github.com:csi4999-mims/Website.git htdocs
```

![Screenshot of Git Bash running each of the above commands in
sequence](media/htdocs-copy-clear-and-clone.png)

_Troubleshooting_: Until the CakePHP files are merged with the master
branch on GitHub, you may need to use `git checkout` to check out
whatever branch has them available before running Composer in the next
section.

## Composer ##

Though we have cloned the repo, not all the files necessary to run the
CakePHP site are in version control.  They are intentionally left out
because they contain site-specific configurations or sensitive data
(like passwords).  To get all the necessary files that are not in
version control, we will use `composer`.

## Troubleshooting ##

Bash is a UNIX shell, and as such, is subject to most of the trappings
of UNIX environments.  It typically looks to the environment variable
`HOME` for your home directory.  If you find that the ssh key you
created in the [Git Bash](#git-bash) section ends up not working for
you, this may be the culprit.  Just add an environment variable `HOME`
which points to your `C:\Users\Username` directory (obviously
replacing `Username` with your _actual username_).

![Windows' environment variables dialog with HOME set to
C:\Users\User](media/home-environment-variable.png)
