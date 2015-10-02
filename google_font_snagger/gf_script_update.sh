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
# should probably refactor to use md5sum
if [ "$CHKINIT" == "$CHKNEW" ]; then
	printf "It looks like there isn't any new files";
	printf "\n deleting the downloaded master.zip cuz there isn't anything new\n and to save space";
	rm ~/Documents/google_font_tracker/new_one/master.zip;
elif [ "$CHKNEW" gt "$CHKINIT" ]; then
	echo "some stuff";
	printf "looks like we got some new fonts hommie\n lets get this copyd ovah";
	cd new_one;
	unzip master.zip;
	cd ~/Libarary/Fonts;
	cp -rv $(find ~/Documents/google_font_tracker/new_one/* | grep .ttf) .;
	printf "cool looks like we're good - got new stuff copied over";
	printf "gonna take this last new font package as a measure";
	rm -v ~/Documents/google_font_tracker/master.zip;
	cp -rv ~/Documents/google_font_tracker/new_one/master.zip ~/Documents/google_font_tracker/;
	rm -v ~/Documents/google_font_tracker/new_one/master.zip;
	printf "alright got the new standard set, it good now";
	printf "you all good \n will check again soon so u stay up to date";
else
	echo "idk";
fi
