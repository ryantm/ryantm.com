# haml and sass rakefile {#haml-and-sass-rakefile}
Here is a rakefile I cooked up for generating a website form static haml and sass files.

```ruby
require 'haml/engine'
require 'sass/engine'

task :default => [:web]
task :web => [:haml,:sass]

desc 'Compile haml templates to html'
task :haml do
  dirs =  Dir['**/*.haml']
  dirs.each do |f|
    File.open(f, 'r') do |fi|
      File.open(f.gsub('haml','html'),'w') do |d|
        d << Haml::Engine.new(fi.read).to_html
      end
    end
  end
end

desc 'Compile sass templates to css'
task :sass do
  dirs =  Dir['**/*.sass']
  dirs.each do |f|
    File.open(f, 'r') do |fi|
      File.open(f.gsub('sass','css'),'w') do |d|
        d << Sass::Engine.new(fi.read).to_css
      end
    end
  end
end
```
