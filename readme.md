## subversion image for NewIT related development

Intended for Linux developers, who have problems with local version of OpenSSL and subversion while trying to work with NewIT subversion server

# Image building

```
$ ./b.sh
```

# Environment variables

If you don't like any default values, feel free to export one or multiple variables:
* NEWIT_SVN_HOME_DIR - folder to store common subversion stuff (in order to not clash with local ~/.subersion folder)
* NEWIT_SVN_USER - your subversion username
* NEWIT_SVN_PWD - your subversion password

# Running container

You can either run local `./svn.sh`, or alias it (from .bashrc, .zshrc etc) as:

```
alias svn=$WRK_DIR/newit-svn/svn.sh
```

Example (of using shell script directly):

```
$./svn.sh ls <newit-url>
```

Example (of using alias):

```
$ svn ls <newit-url>
```

## Upgrading to the fresh versions of gentoo

TBD...
