# How to Make Your Own Free Website in 20 Minutes {#how-to-make-your-own-free-website-in-twenty-minutes}

2008-12-23

By following this post you will have a website that you can visit in
your web browser just like this one, for nearly free(less than 5 cents
a year) in 20 minutes. In addition to being easy to set up, your
website will be on top of a highly scalable and reliable architecture
which will handle traffic spikes with ease.

The company we will use to host this site is called
[NearlyFreeSpeech.NET](http://www.nearlyfreespeech.net).

## Signing up

1. Visit [NearlyFreeSpeech.NET](http://www.nearlyfreespeech.net) now.
2. Click "Sign Up Now" in the top left.
3. Click "Create a membership."
4. Fill out the form and click "Sign Up for NearlyFreeSpeech.NET."
5. Check your email for the confirmation email.
6. Click the link in the email, or follow the other sign in
   methods. Remember the password in the email as well.
7. Enter your password to log in.

## Making your site

1. Click "Create a new account" on the right sidebar.
2. Fill out the form and click "Save Changes."
3. At this point NearlyFreeSpeech.NET will give you 2 cents for free
   for a 30 day trial usage. (After 30 days, you will have to pay at
   least 25 cents to keep your site running.)
4. Click "sites," then "Create a New Site" on the right sidebar.
5. Pick a name for your site that will become part of the URL of your
   site. For example, a short name of "ryantm" would give
   "http://ryantm.nfshost.com."
6. Click "Continue."
7. Unless you already have a domain name, select "No" and click "Continue."
8. Click "Create Now."


## Adding your first web page

1. Open a text editor (on Windows try Notepad).
2. Enter the following text:
   ```html
   <html>
     <head>
       <title>My First Page</title>
     </head>
     <body>
       <h1>Hello World Wide Web!</h1>
     </body>
   </html>
   ```
3. Save your text file as "index.html".

## Uploading your first web page ( on windows )

1. Open Windows Explorer (Shortcut: type "windows+r" then type
   "explorer" and press enter).
2. Type "ftp.phx.nearlyfreespeech.net" into the address bar.
3. Enter your username, "YourUserName_YourWebsiteShortname" and the
   password you received by email.
4. Click and drag your index.html file into the directory.

## Uploading your first web page ( on Linux )

1. Open a terminal
2. type
   ```
   rcp index.html YourUserName_YourWebsiteShortName@ssh.phx.nearlyfreespeech.net:/home/public   ```

## Visiting your site
1. Visit your site at http://YourWebsiteShortName.nfshost.com.
2. Enjoy
