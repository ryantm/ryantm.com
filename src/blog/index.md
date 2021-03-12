# index {#index}
%h1=link_to "Articles", "blog/"

-model('post').each do |post|
  .entry
    =render :partial=>"pages/blog/post.hatl", :locals=>post.merge(:index=>true, :url=>"blog/#{post['path']}/", :summary=>true)

-@title = "Articles"
