with import<nixpkgs> {};

writeScriptBin "yt" ''
  #!${pkgs.stdenv.shell}

  function download {
    youtube-dl -o '/var/lib/mpd/music/%(title)s.%(ext)s'\
    --extract-audio --audio-format mp3 $1
  }

  function search {
    echo "" | bemenu -p "YT Search:"
  }

  SRC=$(search)
  if [ "$SRC" == "" ]; then
	exit 1
  fi
  IND=$(curl -s https://invidio.us/search?q=$\{SRC// /+\})
  NM=$(echo $IND | pup 'a[href*=/watch?]:only-child text{}'| bemenu -l 10)
  URL=$(echo $IND | pup 'a[href*=/watch?]:contains("'"$NM"'") attr{href}' |
	awk '{ print "https://invidio.us" $0 }')
  echo $URL
  download $URL
''
