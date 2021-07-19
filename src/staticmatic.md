# StaticMatic {#staticmatic}

2007-05-28

Going along the lines of my last post there is a new rubygem that is
focusing on building a framework for static webpages using haml and
sass as its backbone. It's called
[StaticMatic](https://github.com/staticmatic/staticmatic) and it's a
gem so...

```ShellSession
sudo gem install staticmatic
```

Then after you get it installed you need to do

```ShellSession
staticmatic setup my_app_name
staticmatic build my_app_name
```

This will give you a directory structure of my_app_name -> site,
src. The site dir contains your site built from the source. So every
time you do staticmatic build my_app_name you will be building your
site/ dir from your src/ dir. This could use the improvement of a
Rakefile to make the directory not matter, so I think I'll be
attempting to add my Rakefile into the project.
