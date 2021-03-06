# haml why you should use it {#haml-why-you-should-use-it}
%p
  <a href="http://nex-3.com/posts/76-haml-2-0">HAML 2.0</a> is out. I've been using HAML since back when I made my <a href="http://www.sassins.com">Assassins Game Hosting Service</a> in 2007. If you are still using ERB or some other templating language for your web applications here is why you should given HAML a try.

%p
  <strong>HAML gets rid of end tags.</strong> By using Python like indentation it removes the need for you to type all of those pesky HTML endtags. Also, it lets you quickly see the nesting of tabs simply by the indentation of the line you are on. This quick look at nesting is espcially helpful when your HTML files start to get longer than 80 lines or so.

%p
  <strong>HAML generates pretty source.</strong> I am anal about how my HTML souce looks. I want it to be indented with spaces at every nesting point. If you've ever seen the HTML source for a webpage generated in on of the <a href="http://www.adobe.com/products/dreamweaver/">terrible</a>, <a href="http://office.microsoft.com/en-us/frontpage/default.aspx">horrible</a> WYSIWYG editors, you know exactly what I don't want. Every time I look at the source of pages generated by those tools a little piece of me dies. HAML is the complete opposite of this. It generates the cleanest possible HTML document it can. The file format convinces you to write cleanly, but it also smooths over some errors you could make. For instance, if you include unnecessary newlines in your source file, HAML removes them, leaving on the effectful newlines.

%p
  <strong>HAML is integrated with Ruby. </strong>ERB's Ruby integration is a joke. All it does it execute Ruby between &lt;% %&gt; with a little extra handling for loops and if statements. HAML's Ruby integration is like a Red Corvette. You can use = for ruby code with output, or == for ruby strings, or - for Ruby code without output. Also, now with HAML 2.0 error handling for Ruby and HAML is great a well.

%p
  <strong>HAML installation is easy.</strong> You can try HAML out right away with little effort, and no conflict with your current Rails installs just do the following:

%pre
  %code.html.language-bash
    gem install haml --no-ri

%pre
  %code.html.language-bash
    haml --rails path/to/app

%p
  I should also mention that HAML is used in my favorite <a href="http://staticmatic.rubyforge.org">static HTML generator</a>, Staticmatic.
