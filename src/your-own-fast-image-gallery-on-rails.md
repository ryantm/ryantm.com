# your own fast image gallery on rails {#your-own-fast-image-gallery-on-rails}
%p
  If you've ever used Facebook's photo application you might have wondered how they make the images go so fast. Since I wanted to have fast viewing of our snapshot galleries over at Brawl Snapshots, I set out to figure out how to do it.

%p
  The main component of a fast gallery is caching. By telling the browser to load images in hidden divs before they are actually displayed to the user, the browser cache is primed for the quick switch.

%p
  The way you request these images in the background is the meat of the problem and the solution depends on what you are trying to do. With Facebook, each gallery has a limited number of photos in it, so Facebook loads all of the imag URLs, comments, and other meta data when you look at the first photo in the gallery. In the case of Brawl Snapshots this approach wouldn't work because some of our galleries have over 4000 images in them. Loading and rendering the meta-data for 4000 images just to view one would be a little wasteful.

=image_tag "fast-gallery-requests.png"

%p
  Fig 1: Firebug shows AJAX requests from visiting one image

%p
  So instead of loading all the data up front I opted to use some AJAX requests to populate my cache as needed. When you go to a image in the Brawl Snapshot Gallery, it first loads the image you are on then it uses AJAX to asynchronously load the next and previous image in the background. After those finish we load the next's next and previous's previous image as well (see figure 1). This gives our viewers a buffer of two really quick images, which gives us ample time to load some more for all but the quickest users.

%p
  I will try to explain the essential components.

%h3 1. The Populator (populates the cache when needed)

%pre
  %code.html.language-javascript
    :preserve
      window.onload = function() {
        if (YAHOO.env.ua.ie || YAHOO.env.ua.gecko || YAHOO.env.ua.webkit) {
          setInterval(populate, 200);
        }

        function populate() {
          var items = $('items');
          if (needsNext() &amp;&amp; gettingMoreNext == false) {
            id = lastObject(items).id;
            gettingMoreNext = true;
            new Ajax.Request('/snapshots/'+id+'/next?'+queryString, {asynchronous:true, evalScripts:true, method:'get'});
          }

          if (needsPrevious() &amp;&amp; gettingMorePrevious == false) {
            id = firstObject(items).id
            gettingMorePrevious = true;
            new Ajax.Request('/snapshots/'+id+'/previous?'+queryString, {asynchronous:true, evalScripts:true, method:'get'});
          }
      }
%p
  I set the populate function to run every 200 milliseconds with the setInterval() function. Inside the populate function we test if we need to get more, or if we are already getting more snapshot pages. If we aren't then we launch an AJAX request to get more. When the AJAX requests return the scripts inside them are automatically evaluated. The code on the server side looks like this:

%pre
  %code.html.language-ruby
    :preserve
      def previous
        item_parial = render_to_string(:partial=&gt;"snapshots/show", :locals=&gt;{:snapshot=&gt;@snapshot}
        render :update do |page|
          page.insert_html :top, 'items', item_partial
          page &lt;&lt; "newStuff('previous');"
        end
      end

%p
  What this does is push the new snapshot into the top of the #items div, and then notify our page that it worked by called newStuff. Previous pushes onto the top of the #items div, and Next pushes onto the bottom of the #items div. This orientation is important because it lets us navigate through the cache later.

%h3 The Navigator

%p
  If you've followed these rough steps and modified them for your needs, you should have a list of divs inside an #items div that are in gallery order. Now you want to navigate through them using Javascript. To do this we have to make use of the <a href="http://developer.yahoo.com/yui/history/" title="Yahoo! UI Library: Browser History Manager">Yahoo! UI Library: Browser History Manager</a> which will give you cross browser history and make the back button work. Without this library it is very hard to make the back button work on a Javascript navigated gallery. Luckily Yahoo lets you only include the parts of its libraries upon which Browser History Manager Depends:

%pre
  %code.html.language-html
    :preserve
      &lt;script src="http://yui.yahooapis.com/2.5.1/build/yahoo/yahoo.js"&gt;
      &lt;script src="http://yui.yahooapis.com/2.5.1/build/event/event.js"&gt;
      &lt;script src="http://yui.yahooapis.com/2.5.1/build/history/history.js"&gt;
      &lt;iframe id="yui-history-iframe"&gt;
      &lt;input id="yui-history-field" type="hidden" /&gt;
%p
  This code only needs to be included once for your gallery viewer, not for each item. Now let's look at the top of the fast.js file where we do some more history initializations

%pre
  %code.html.language-javascript
    :preserve
      function stateChange(state) {
        if (ignoreOneChange) {
          ignoreOneChange = false;
          return;
        }
        var ar = state.split("/");
        var our_id = "";

        for(piece in ar)
          if (ar[piece].indexOf &amp;&amp; ar[piece].indexOf("?") != -1)
            our_id = ar[piece].split('?')[0];

        toElm = document.getElementById(our_id);
        if (toElm)
          itemTo(document.getElementById(our_id),false);
        else
          window.location = state
      }

      YAHOO.util.History.register("items", window.location.toString(), stateChange);
      YAHOO.util.History.initialize("yui-history-field", "yui-history-iframe");

      var bookmarkedState = YAHOO.util.History.getBookmarkedState('items');
      if (bookmarkedState != null)
        window.location = bookmarkedState;

%p
  stateChange is a function that I register with the history manager to be called every time the browser's location changes. The purpose of stateChange is synchronize the state of the browser with the history, so this is why if the requested spot in history is in the current cache we immediately jump to that image, otherwise we have to tell that page to load with window.location. Then I make sure there is no current bookmarkedState. If someone were to bookmark an AJAX snapshot with ID 30 the URL might look something like: http://bs.com/snapshots/10#/snapshots/30 so you can see why you might want to revert this to http://bs.com/snapshots/30. You need to do this since web servers are not sent any part of the URL after the octothorpe(#) you would end up at snapshot 10 when you wanted to be at snapshot 30.

%p
  The last thing to cover is how to insert something into the history. Basically whenever we click a Next link we run some javascript. In this case we run nextItem(), which calls updateURL if it is successful.

%pre
  %code.html.language-javascript
    :preserve
      function updateUrl() {
        var newState = "/snapshots/"+currentItem.id+"?"+queryString;
        if ($('yui-history-iframe')
          $('yui-history-iframe').contentWindow.document.title = document.title;
        YAHOO.util.History.navigate("items", newState);
      }

%p
  This tells the history manager to navigate to the new state. We also set the title of the iframe here so that the history in Internet Explorer contains the page titles. When the url is updated we need to make sure that the title of the page is updated as well. In order to do this I have an element inside each item div that contains the title it should be, and then I look it up to put as the document title when that snapshot is viewed.

%p
  Well that about sums up everything I learned about fast galleries. Hopefully this helps you make fast galleries on your own site.
