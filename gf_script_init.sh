echo "Google Fonts is awesome - would you like to download and install them all? (use y for yes | use n for no)";
read FONT_ANSWER;
if ["$FONT_ANSWER" == "y" | "yes" | "YES" | "Yes" ]; then
	echo "\n okay - building temp directory under your download folder, then download, then I'll remove that folder";
	mkdir -p ~/Downloads/temp_font;
	cd ~/Downloads/temp_font;
	wget --show-progress https://github.com/google/fonts/archive/master.zip;
	echo "\n downloaded - will extract now";
	unzip master.zip -d drop_temp_font;
	echo "\n now going to count out listed files for log";
	cd drop_temp_font/fonts-master;
	find . | grep .ttf -c | tee  echo "$(date)" &> font_count;

else
	echo "something";	
fi
