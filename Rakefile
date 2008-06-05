require 'rubygems'
require 'rake'
require '~/staticmatic/lib/tasks/staticmatic'

t = task :default
t.enhance([:build, :update])

task :update do
  puts "rsyncing"
  system("rsync -avz site/. nfs:/home/public")
end

