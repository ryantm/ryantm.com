require 'rubygems'
require 'staticmatic'

t = task :default
t.enhance([:build, :update])

desc 'Builds the static website'
task :build do
  exec('staticmatic build .')
end

task :update do
  puts "rsyncing"
  system("rsync -avz site/. nfs:/home/public")
end

