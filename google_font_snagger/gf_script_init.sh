#!/bin/bash -x
# Google font inital setup
printf "lets install google fonts and a font updater cronjob";
MYHOME="$(PWD)";
printf "\n okay - building temp directory under your download folder, then download, then I'll remove that folder";
`mkdir -p ~/Downloads/temp_font`;
cd ~/Downloads/temp_font;
`curl -LOkv https://github.com/google/fonts/archive/master.zip`;
printf "\n downloaded - will extract now";
printf "$(PWD)";
unzip master.zip;
printf "\n lets copy them over now";
cd ~/Library/Fonts; 
cp -rv $(find ~/Downloads/temp_font/fonts-master/* | grep .ttf) .;
printf "\n cool looks like we're in bizznezz";
printf "\n now lets set something up an updater and stuff to help stay on top of the latest fonts";
printf "\n gonna grab some stuff";
mkdir -v ~/Documents/google_font_tracker;
cp -rv ~/Downloads/temp_font/fonts-master/font_count_inital ~/Documents/google_font_tracker/;
chmod 777 $MYHOME/gf_script_update.sh;
cp -rv $MYHOME/gf_script_update.sh ~/Documents/google_font_tracker/;
cp -rv ~/Downloads/temp_font/master.zip ~/Documents/google_font_tracker/;
printf "\n alright time to schedule that cronjob";
crontab -l > thiscron;
echo "00 15 * * 1-5 ~/Documents/google_font_tracker/gf_script_update.sh" >> thiscron;
crontab thiscron;
rm -v thiscron;
printf "\n all set up :) this will check everday at 3pm by default";