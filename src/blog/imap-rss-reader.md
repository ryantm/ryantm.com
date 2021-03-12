# imap rss reader {#imap-rss-reader}
%p Google Reader was going away; I needed a replacement. I tried lots of other webapps but none of them seemed to have the feature where you have to explicitly mark something as read. Also, wouldn't it be nice to take control of my feed reading data, securing it from prying eyes? My solution is to use a server to fetch RSS feeds and turn them into email. It turns out that IMAP is already a great protocol for handling a steady stream of messages. I have been using this system for a week and it has worked well, syncing across multiple devices and operating systems.

%p I would like to give you a high-level look at how I did it. This is not meant to be a step by step guide. I might make one of those later but that requires a lot more work. If you have trouble, please let me know, and I will try to improve this guide.

%p==I used a virtual private server from #{link_to "DigitalOcean", "https://www.digitalocean.com/"}, which let me use the latest version of Ubuntu Server. The particular server you use should not matter too much. Please make sure to lock down your server appropriately. I followed this #{link_to "initial server lockdown guide", "http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers"}.

%p Packages to install:
%ul
  %li <b>rss2email</b> feed fetcher and emailer
  %li <b>postfix</b> handles email delivery

%p Downloaded subscriptions.xml OPML file from Google. Configure rss2email on the server to send email to the email address prepared for RSS reading. (I suspect you can use Gmail or some other webmail provider. I used a mailbox on the same server using Dovecot and Postfix.)
%pre
  %code.html.language-bash
    =preserve "r2e new EMAILADDRESS\nr2e opmlimport subscriptions.xml"
%p
  If you want all of the RSS entries that are currently in your feeds, to show up in your inbox
%pre
  %code.html.language-bash
    r2e run
%p
  If you want only new RSS entries, first run
%pre
  %code.html.language-bash
    r2e run --no-send
%p
  Some of your feeds might fail. You can delete them with
%pre
  %code.html.language-bash
    r2e delete FEEDNUMBER
%p
  You can add new feeds with
%pre
  %code.html.language-bash
    r2e add FEEDURL
%p After rss2email is running how you want it to, set it up as a crontab. Edit /etc/crontab to contain an entry like
%pre
  %code.html
    0 *	* * *	ryantm	r2e run

%p You should now have a RSS fetcher that sends emails. If you used a webmail provider, you already probably have cross-platform reading support. If you rolled your own mailbox, you can try other email readers. I think Thunderbird works well.
