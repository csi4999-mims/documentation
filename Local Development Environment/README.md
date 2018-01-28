Local Development Environment
=============================

This guide is for the creation of a local
[CakePHP](https://cakephp.org/) development environment on Windows 10
(though it should work fine for other modern versions of Windows).

Components
----------

The tools we will be using for local development are as follows:

- [XAMPP](https://www.apachefriends.org)
- [Composer](https://getcomposer.org/)
- [Git Bash](https://git-scm.com/download/win)

XAMPP Installation & Configuration
----------------------------------

Install XAMPP to the default location (i.e. `C:\xampp`).

For CakePHP to work, we need to configure PHP to use the `intl`
extension, which is _included_ in XAMPP, but not _enabled_ (see
[here](https://book.cakephp.org/3.0/en/installation.html) for more
information).  To enable it, open up `C:\xampp\php\php.ini` in your
favorite text editor, and uncomment the line with the following:

```conf
extension=php_intl.dll
```

If this line doesn't exist, just add it to the bottom of the file (or
wherever it makes sense to add it).

All of the files which compose the website are located in
`C:\xampp\htdocs`.  After installing XAMPP (and ignoring the Bitnomi
sales lead attempt), you should be looking at a
