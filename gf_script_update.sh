# !/bin/bash
# Google font update script
cd ~/Documents/google_font_tracker;
mkdir -pv ~/Documents/google_font_tracker/new_one;
cd new_one;
curl -LOkv https://github.com/google/fonts/archive/master.zip;

CHKINIT="`unzip -l ~/Documents/google_font_tracker/master.zip | grep .ttf -c`";
CHKNEW="`unzip -l ~/Documents/google_font_tracker/new_one/master.zip | grep .ttf -c`";
echo "$CHKINIT";
echo "$CHKNEW";

if [ "$CHKINIT" == "$CHKNEW" ]; then
	printf "It looks like there isn't any new files";
	printf "\n deleting the downloaded master.zip cuz there isn't anything new";
	rm ~/Documents/google_font_tracker/new_one/master.zip;	
elif [ "$CHKNEW" gt "$CHKINIT" ]; then
	#statements
fi