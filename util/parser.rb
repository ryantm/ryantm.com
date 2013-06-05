require 'rubygems'
require 'hpricot'
doc = Hpricot(File.read("wordpress.2008-09-10.xml" ))


doc.search('channel/item').each do |element|
  link = element.inspect.match(/\{emptyelem <link>\} "([^"]*)" \{bogusetag <\/link>\}/).captures[0]

  parts =  link.split('/')
  next if parts.size != 8

  name = parts[7]
  title = element.at('title').inner_html
  pubdate =  element.at('pubdate').inner_html
  content = element.at('content:encoded').inner_html.gsub("<![CDATA[", "").gsub("]]>", "")
#<![CDATA[This is the <a href="http://www.fodforthought.com/?itemid=135">complete iPhone review</a> that I wrote.]]>


  File.open("./src/pages/blog/#{name}.haml", "w") do |f|
    f << <<EOF
-@title = '#{title}'
%h1=@title
published at #{pubdate}

%p
  #{content}
EOF
  end
end
