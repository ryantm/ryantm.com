# how to win at scrabulous using regular expressions {#how-to-win-at-scrabulous-using-regular-expressions}
.right
  <img src="http://www.ryantm.com/images/Scrabble_board_in_play.jpg" alt="Scrabble" width="186" align="left" height="140" />

%p
  This will tell you how to win at Scrabulous using a few simple Linux commands and a working knowledge of Regular Expressions. The basic principle behind this approach is to quickly write regular expressions to search for every possible word you can make a specific part of the board. By cating a scrabble word list into a pipe and using egrep with regular expressions, you can quickly and easily match patterns against your tiles and the state of the board.

%p
  Quick example:

%pre
  %code.html.language-bash
    :preserve
      $ wget http://www.ryantm.com/scrabble-word-list.tar.gz
      $ tar -xvzf scrabble-word-list.tar.gz
      $ cat scrabble-word-list | egrep "^A[EPABVT]{4}$"
      ABATE

%p
  We've found a valid 5 letter scrabble word that starts with an A (^ means start of line), contains 4 of the set E,P,A,B,V,T ($ means end of word). Expanding on this concept you can do all sorts of awesome patterns.

%p
  Say you want to make a word that goes from what you currently have to a triple word score 5 tiles away that connects to a D. You just do something like this:

%pre
  %code.html.language-bash
    :preserve
      $ cat scrabble-word-list | egrep "^[EABTTE]*D$"
      ABATED
      BATTED
      BETTED
      TABBED
      TATTED
      TEATED

%p
  Then suddenly you've got a list of words that work for what you want. I did * here instead of {4} * means match as many characters as you can. It's usually a good idea to start with * and narrow it down with {number} if you need to.  You might notice that one of them doesn't work (TABBED), because you don't have two B's. The regular expression matcher doesn't care how many times you put a letter inside a set ([]) and it will match it as many times as it can. You can filter these words quickly yourself though, because you know you don't have two B's.

%h3 The General Principle

%ol
  %li Take what letters you have an form at set: [BZTQEAI]
  %li Find a starting or ending place: ^ACE or Y$
  %li Put it together with the number of letters you want to use: "^ACE[BZTQEAI]*"
  %li Double check the word with reality
  %li Repeat until you are satisfied with your word score.
