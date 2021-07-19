# How to Move Your MUD to Bluehost for Only $6.95 Per Month {#how-to-move-your-mud-to-bluehost-for-only-695-per-month}

2007-06-16

Recently someone posted on The MUD Connector about having problems
with their host. I offered the suggestion of using a non-mud-host
specific hosting provider to run a mud, like I do on Deimos
MUD. (quarkmud.com 6666) Here is a tutorial for doing it yourself.

Obtain an account on bluehost. (www.bluehost.com)

Click sign up now. Enter domain name: www.yourMUD.com/org whatever you
want. I personally recommend you add domain privacy with Bluehost.
Enter all of your information about select that you are going to pay
for 24 months right away.

now you are thinking: woah why is he saying to go for 2 years right
away, right? Here's why: It only costs $166.80 for 2 years! Plus
Bluehost has a great money back guarantee if you don't like their
service. So if you 1 year from now you decide that your MUD isn't
going to exist anymore you just ask for a refund. Also, they throw in
the free domain name, which is valued at $10 so that's great as well.

Now comes the slightly hard part. You have to get shell access. This
involves proving you are a citizen of the USA. If you aren't citizen
of the USA, sorry. To do this you need to email them a copy of your
drivers license or passport. The info on it should match up with the
info you entered above. I'm not exactly sure where to email this to,
so just call Bluehost (The number is on their website frontpage) and
ask them what to do. They are fairly helpful.

Okay now you have shell access. This tutorial isn't really how to set
up a new MUD but more to move your MUD to Bluehost. I might do a later
tutorial about how to set up a new MUD if people are really
interested.

Presumably you have the files of your other mud somewhere on another
shell. If this is the case do:

```ShellSession
$ scp your-user@otherhost.com:~/path/to/mud/ your-user@yourMUD.com:~/mud/
```

That could take a while to finish because your MUD probably has a
crapload files. If your MUD has a MySQL database instead, you'll still
be okay. You just dump your database on your host and then upload it
into the MySQL database on Bluehost (which you can create really
easily with the Bluehost cPanel)

There are many other ways to get the files onto the server and I can't
cover them all, but some include FTP, RSync, and Subversion.

Okay now that this is done you need to compile your MUD on
Bluehost. This could be more difficult than your previous MUD
host. For instance, my circleMUD would compile fine on the old gcc
that Wolfpaw was using, but Bluehost has a much newer GCC so I got a
whole bunch of warnings and errors. The best way to fix these is to
just go error by error, then warning by warning, until they are all
fixed. After I fixed them all my MUD compiled okay. And I was able to
run it. After it was running I could connect to it with:

```ShellSession
$ telnet quarkmud.com 6666
```

you'd just substitute your domain name and port there.

One last thing you should know is that sometimes Bluehost kills
processes that have been running for a really long time. If this
happens you want your MUD to come back up in a reasonable time. You
cannot solve this the traditional MUD way of just having an autorun
script that is constantly running. Instead you have to use a cron
job. You can make the cron job using the cPanel interface again. It is
best to make a script that will be run to check if your MUD is still
running. Here is my script for doing so:

```Bash
#~/persistent_processes.sh

#DeimosMUD
DM=`ps ex | grep circle`
if [ -z "$DM" ]; then
  echo "Restarting DeimosMUD"
  cd /home/your-user-name/mud/
  ./bin/circle 6666 &
fi
```

Make sure the file is executable with:

```ShellSession
$ chmod +x persistent_processes.sh
```

This checks if there is a process running that contains the word
'circle.' If there is not, it restarts the server using the proper
shell command to restart the server. I set this script to run every
minute using the cron task. To do this go to "Cron Jobs" on the cPanel
and then select "Advanced Unix Style." Then fill all of the boxes on
the left in with asterisks and type the path to the file you saved
above. The path should be something like
"/home/your-user/persistent_processes.sh".  There you have it, now you
have a stable MUD running for a good price.

Performance Note:

My performance on Bluehost has been better than Wolfpaw. Players all
reported the speed increase which was quite nice to experience
especially for less money.
