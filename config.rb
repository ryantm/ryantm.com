######################
#### Previewer Options

# The host and port that the Mongrel previewer server should bind to.
StaticMatic::Config[:host] = "0.0.0.0"
StaticMatic::Config[:port] = "3000"

# directory_index is are the file extensions to be tried in the event that a 
# URI points at a directory in the site directory. This is only used by the
# previewer. If you want to set the DirectoryIndex of your deployed staticmatic
# site, you need to configure your webserver.
#
# Include instructions for Apache & Lighttpd here later.
StaticMatic::Config[:directory_index] = "index.html default.html"

#####################
### Rendering Options

#Sass Options
#Sass::Engine.new(template, StaticMatic::Config[:sass_options]).render
StaticMatic::Config[:sass_options] = {}

#Haml Options
#Haml::Template.options = StaticMatic::Config[:haml_options]
StaticMatic::Config[:haml_options] = {}
