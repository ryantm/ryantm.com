# IMAP RSS reader {#imap-rss-reader}

2013-6-05

Google Reader was going away; I needed a replacement. I tried lots of
other webapps but none of them seemed to have the feature where you
have to explicitly mark something as read. Also, wouldn't it be nice
to take control of my feed reading data, securing it from prying eyes?
My solution is to use a server to fetch RSS feeds and turn them into
email. It turns out that IMAP is already a great protocol for handling
a steady stream of messages. I have been using this system for a week
and it has worked well, syncing across multiple devices and operating
systems.

I would like to give you a high-level look at how I did it. This is
not meant to be a step by step guide. I might make one of those later
but that requires a lot more work. If you have trouble, please let me
know, and I will try to improve this guide.

I used a virtual private server from
[DigitalOcean](https://www.digitalocean.com/), which let me use the
latest version of Ubuntu Server. The particular server you use should
not matter too much. Please make sure to lock down your server
appropriately. I followed this [initial server lockdown
guide](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers).

Packages to install:

* <b>rss2email</b> feed fetcher and emailer
* <b>postfix</b> handles email delivery

Downloaded subscriptions.xml OPML file from Google. Configure
rss2email on the server to send email to the email address prepared
for RSS reading. (I suspect you can use Gmail or some other webmail
provider. I used a mailbox on the same server using Dovecot and
Postfix.)

```ShellSession
$ r2e new EMAILADDRESS
$ r2e opmlimport subscriptions.xml
```

If you want all of the RSS entries that are currently in your feeds,
to show up in your inbox

```ShellSession
$  r2e run
```

If you want only new RSS entries, first run

```ShellSession
$ r2e run --no-send
```

Some of your feeds might fail. You can delete them with

```ShellSession
$ r2e delete FEEDNUMBER
```

You can add new feeds with

```ShellSession
$ r2e add FEEDURL
```

After rss2email is running how you want it to, set it up as a
crontab. Edit /etc/crontab to contain an entry like

```Text
0 *	* * *	ryantm	r2e run
```

You should now have a RSS fetcher that sends emails. If you used a
webmail provider, you already probably have cross-platform reading
support. If you rolled your own mailbox, you can try other email
readers. I think Thunderbird works well.
