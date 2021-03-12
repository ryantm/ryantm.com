# emacs marmalade with demoted errors {#emacs-marmalade-with-demoted-errors}
%p www.marmalade-repo.org was down today, which caused my emacs to crash on start up. Here is a quick way to get around the crash. Instead of:

%pre
  %code.html.language-lisp
    =preserve do
      :escaped
        (dolist (p my-packages)
          (when (not (package-installed-p p))
            (package-install p)))

%p wrap it with the with-demoted-errors macro, which will change the errors from crashes to messages in the *Messages* buffer.

%pre
  %code.html.language-lisp
    =preserve do
      :escaped
        (with-demoted-errors
          (dolist (p my-packages)
            (when (not (package-installed-p p))
              (package-install p))))

%p This isn’t so great because you might not notice when it fails, but maybe that is okay if you don’t try to get packages every time you start up.

%p You also need to consider how your subsequent elisp will handle the lack of the packages you desire.
