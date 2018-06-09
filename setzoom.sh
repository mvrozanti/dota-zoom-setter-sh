#!/bin/bash
DEFAULT_STEAM_CLIENT_PATH='~/.steam/steam/steamapps/common/dota\ 2\ beta/game/dota/bin/linuxsteamrt64/libclient.so'
if [ -f "$DEFAULT_STEAM_CLIENT_PATH" ]; then echo Located default client path; else echo "Could not find default dota 2 client path"; exit 1; fi
if [ $(grep -c "$DEFAULT_STEAM_CLIENT_PATH") -eq 0 ]; then
    read -p "New zoom: " $zoom
    case $zoom in
        ''|*[!0-9]*) echo "Bad zoom entered" ;;
        *) sed -i 's/1134/$zoom/' "$DEFAULT_STEAM_CLIENT_PATH" ;;
    esac
else
    echo "Zoom was already set"
fi

#  nexor  …  game  dota  bin  linuxsteamrt64  cat libclient.so |grep 1134
# Binary file (standard input) matches
#  nexor  …  game  dota  bin  linuxsteamrt64  cat libclient.so |grep -c 1134
# 1
#  nexor  …  game  dota  bin  linuxsteamrt64  cat libclient.so |sed -r 's/1134/1200/'|grep -c 1134
# 0
#  nexor  …  game  dota  bin  linuxsteamrt64  cat libclient.so |grep -c 1134
# 1
