# lsof lists open file descriptors {#lsof-lists-open-file-descriptors}
%p
  lsof is a linux command that lists the open file descriptors on your system. I like to use the following options to help reduce spam:

%pre
  %code.html.language-bash
    :preserve
      lsof -c command-name
      lsof -p port-number
