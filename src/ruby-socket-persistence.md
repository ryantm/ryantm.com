# ruby socket persistence {#ruby-socket-persistence}
%p
  It's surprisingly simple to persist your socket connections while restarting a Ruby program. The key lies in understand how Ruby handles file descriptors. A file descriptor is a number that represents an open file that is buffered in the OS Kernel. Now I've only tried this technique on Linux so I don't know if it works on Windows, so chime in on the comments if it does or does not work. Let's start by exploring file descriptors a little bit so we can improve our Linux knowledge. If you want immediate gratification you can skip down to the bottom-most snippet.

%pre
  %code.html.language-bash
    :preserve
      irb(main):001:0&gt; require 'socket'
      \=&gt; true
      irb(main):002:0&gt; sock = TCPSocket.open("google.com",80)
      \=&gt; #&lt;TCPSocket:0xb7c73c44&gt;
      irb(main):003:0&gt; sock.fileno
      \=&gt; 3


      note that the file number of the socket is 3. Now look at the output of lsof:

      ryan@rtmlap:~$ lsof -c irb
      COMMAND  PID USER   FD   TYPE  DEVICE    SIZE    NODE NAME
      irb     5645 ryan  cwd    DIR     8,2   12288 1441793 /home/ryan
      irb     5645 ryan  rtd    DIR     8,1    4096       2 /
      irb     5645 ryan  txt    REG     8,1    3564 1177574 /usr/bin/ruby1.8
      irb     5645 ryan  mem    REG     8,1   67408  539926 /lib/tls/i686/cmov/libresolv-2.7.so
      irb     5645 ryan  mem    REG     8,1   38412  539915 /lib/tls/i686/cmov/libnss_files-2.7.so
      irb     5645 ryan  mem    REG     8,1  254076 1208067 /usr/lib/locale/en_US.utf8/LC_CTYPE
      irb     5645 ryan  mem    REG     8,1  190584  522320 /lib/libncurses.so.5.6
      irb     5645 ryan  mem    REG     8,1  196560  522360 /lib/libreadline.so.5.2
      irb     5645 ryan  mem    REG     8,1   17884  539913 /lib/tls/i686/cmov/libnss_dns-2.7.so
      irb     5645 ryan  mem    REG     8,1   40016 1210577 /usr/lib/ruby/1.8/i486-linux/socket.so
      irb     5645 ryan  mem    REG     8,1 1364388  539898 /lib/tls/i686/cmov/libc-2.7.so
      irb     5645 ryan  mem    REG     8,1  149328  539906 /lib/tls/i686/cmov/libm-2.7.so
      irb     5645 ryan  mem    REG     8,1   38300  539902 /lib/tls/i686/cmov/libcrypt-2.7.so
      irb     5645 ryan  mem    REG     8,1    9684  539904 /lib/tls/i686/cmov/libdl-2.7.so
      irb     5645 ryan  mem    REG     8,1  112354  539924 /lib/tls/i686/cmov/libpthread-2.7.so
      irb     5645 ryan  mem    REG     8,1  787660 1177653 /usr/lib/libruby1.8.so.1.8.6
      irb     5645 ryan  mem    REG     8,1    7552  522335 /lib/libnss_mdns4_minimal.so.2
      irb     5645 ryan  mem    REG     8,1   25700   98159 /usr/lib/gconv/gconv-modules.cache
      irb     5645 ryan  mem    REG     8,1   15312 1207882 /usr/lib/ruby/1.8/i486-linux/readline.so
      irb     5645 ryan  mem    REG     8,1  109152  522259 /lib/ld-2.7.so
      irb     5645 ryan    0u   CHR   136,1               3 /dev/pts/1
      irb     5645 ryan    1u   CHR   136,1               3 /dev/pts/1
      irb     5645 ryan    2u   CHR   136,1               3 /dev/pts/1
      irb     5645 ryan    3u  IPv4 1897889             TCP rtmlap.local:45854-&gt;jc-in-f99.google.com:www (ESTABLISHED)

%p
  Alright, so now here's the snippet that shows persistent sockets:

%pre
  %code.html.language-ruby
    :preserve
      #!/usr/bin/ruby
      #simple_connector.rb
      require 'socket'

      puts "Started."

      if ARGV[0] == "restart"
        sock = IO.open(ARGV[1].to_i)
        puts sock.read
        exit
      else
        sock = TCPSocket.new('google.com', 80)
        sock.write("GET /\n")
      end

      Signal.trap("INT") do
        puts "Restarting..."
        exec("ruby simple_connector.rb restart \#{sock.fileno}")
      end


      while true
        sleep 1
      end

%p
  When the program is first run it prints 'Started.' Then it opens a socket to Google and requests the homepage. Then it waits indefinitely until it receives the INT signal (CTRL-C or kill -term PID). After that it runs exec which spawns a new program in the place of the current one. It spawns the same program, with additional command line arguments "restart fileno." When the program starts again these additional arguments make it follow the other path, which uses IO.open(file_descriptor) to open the file descriptor from the file descriptor number that we passed in on the exec line. Then it reads the socket Kernel buffer, which already contains the Google homepage.

%p
  And there you have it, a socket that persists beyond a single program.
