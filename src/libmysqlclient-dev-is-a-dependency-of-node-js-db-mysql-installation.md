# libmysqlclient-dev is a dependency of node js db-mysql installation {#libmysqlclient-dev-is-a-dependency-of-node-js-db-mysql-installation}

2012-08-04

I was trying to install db-mysql and I ran into this error:

```ShellSession
> db-mysql@0.7.6 preuninstall /home/ryan/git/mb-js/node_modules/db-mysql
> rm -rf build/*
npm ERR! db-mysql@0.7.6 install: `node-waf configure build`
npm ERR! `sh “-c” “node-waf configure build”` failed with 1
npm ERR!
npm ERR! Failed at the db-mysql@0.7.6 install script.
npm ERR! This is most likely a problem with the db-mysql package,
npm ERR! not with npm itself.
npm ERR! Tell the author that this fails on your system:
npm ERR!     node-waf configure build
npm ERR! You can get their info via:
npm ERR!     npm owner ls db-mysql
npm ERR! There is likely additional logging output above.
npm ERR! System Linux 3.2.0-26-generic
npm ERR! command “nodejs” “/usr/bin/npm” “install”
npm ERR! cwd /home/ryan/git/mb-js
npm ERR! node -v v0.8.2
npm ERR! npm -v 1.1.36
npm ERR! code ELIFECYCLE
npm ERR! message db-mysql@0.7.6 install: `node-waf configure build`
npm ERR! message `sh “-c” “node-waf configure build”` failed with 1
npm ERR! 
npm ERR! Additional logging details can be found in:
npm ERR!     /home/ryan/git/mb-js/npm-debug.log
npm ERR! not ok code 0
```

The way to fix it is:

```ShellSession
apt-get install libmysqlclient-dev
```
