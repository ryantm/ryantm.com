# Low-fuss syncing for Chrome Secure Shell sessions {#low-fuss-syncing-for-chrome-secure-shell-sessions}

2012-11-03

Chrome Secure Shell is a relatively-new SSH and terminal emulator as
an App for Chrome. I am investigating whether I can use it as an
alternative to PuTTY. As I explore this option, I am going to be
trying to address my main gripes with PuTTY:

* No global configuration
* No portable configuration
* Configuration defaults not sensible especially font, color,
  scrollback buffer size

I discovered a way to synchronize most session configuration of Chrome
Secure Shell using Chrome bookmark syncing.

1. “Sign in” to Chrome on all your machines and make sure bookmark
   syncing is on.
2. On all of your machines, install Chrome Secure Shell
3. On each machine, click on Import in the Chrome Secure Shell
   connection dialog. Navigate to your ~/.ssh/ directory, and import
   everything from that directory into Chrome Secure Shell by
   selecting all the files and clicking Open
4. Create a bookmark folder for your SSH sessions.
5. Inside the folder, for each of your sessions add a bookmark with
   this URL:
   chrome-extension://pnhechapfaindjhompbnflcldabbghjo/html/nassh.html#user@host:port
   The port can be left out if is the default SSH port 22.

With that set up, the bookmarks should sync to all of your machines
and you will be able to log in without more configuration. Enjoy.
