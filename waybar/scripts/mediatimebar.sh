#!/bin/bash

SPOTIFY_STATUS=$(playerctl --player=spotify status)
SPOTIFY_POSITION=$(playerctl --player=spotify position)
SPOTIFY_LENGTH=$(playerctl --player=spotify metadata mpris:length)

BRAVE_STATUS=$(playerctl --player=brave status)
BRAVE_POSITION=$(playerctl --player=brave position)
BRAVE_LENGTH=$(playerctl --player=brave metadata mpris:length)


LENGTH_SECONDS=0
PROGRESS=0
COLOR='#FFFFFF'
BAR=""

# Calc Stats when Spotify is Playing
if [[ $SPOTIFY_STATUS == 'Playing' ]]; then
  LENGTH_SECONDS=$(( $SPOTIFY_LENGTH / 1000000 ))
  PROGRESS=$(echo "scale=0; $SPOTIFY_POSITION * 100 / $LENGTH_SECONDS" | bc)
  COLOR='#1db954'

# Calc Stats when Brave is playing
elif [[ $BRAVE_STATUS == 'Playing' ]]; then
  LENGTH_SECONDS=$(( $BRAVE_LENGTH / 1000000 ))
  PROGRESS=$(echo "scale=0; $BRAVE_POSITION * 100 / $LENGTH_SECONDS" | bc)
  COLOR='#c6852a'
else
  COLOR='#b91d54'
  echo "<span color=\"$COLOR\">Jazz Music Stops</span>"
  exit 0
fi

BLOCKS=$(( $PROGRESS / 3 ))

for i in {1..33}; do
    if [ $i -le $BLOCKS ]; then
        BAR+="<span color=\"$COLOR\">█</span>"
    else
        BAR+="<span color=\"$COLOR\">░</span>"
    fi
done

echo "$BAR"
