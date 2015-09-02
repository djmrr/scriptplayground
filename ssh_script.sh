#!/bin/bash
##ssh_script
clear;
find ~/.ssh/id_rsa.pub &> ~/Documents/temp_ssh_area.txt;
echo "looked to see if I could find the ssh key"; 
head ~/Documents/temp_ssh_area.txt;
if [ ! -f ~/.ssh/id_rsa.pub ]; then
	echo "no id_rsa.pub ssh found";
	echo "would you like for me to create an ssh key for you? (use y for yes | use n for no)";
	read CREATE_ANSWER;
	if ["$CREATE_ANSWER" == "y"]; then
		ssh-keygen -t rsa -N "" -f id_rsa.pub;
		echo "ssh key has been generated";
		echo "now will copy to clipboard";
		pbcopy < ~/.ssh/id_rsa.pub;
		echo "has been copied to cliboard and ready to be pasted";
	elif ["$CREATE_ANSWER" == "n"]; then
		echo "cool I won't build out an ssh key for you";
		echo "would you like to get a refresher on how to build them yourself? (use y for yes | use n for no)";
		read THE_ANSWER;
		if [ "$THE_ANSWER" == "y" ]; then
		open "https://help.github.com/articles/generating-ssh-keys";
		elif [ "$THE_ANSWER" == "n" ]; then
		echo "alrighty suit yourself - exiting";
		else
		echo "don't understand input";
		fi
	else
		echo "don't understand input";
	fi
else
	echo "looks like you have the key";
	echo "I will copy it for you to the clipboard for your pasting use";
	pbcopy < ~/.ssh/id_rsa.pub;
	echo "has been copied to your clipboard"
fi

echo "Would you like to goto your github settings now to enter your ssh key? (use y for yes | use n for no)";
read GH_SETTINGS;
if [ "$GH_SETTINGS" == "y" ]; then
	open "http://www.github.com";
elif ["GH_SETTINGS" == "n"]; then
	echo "okie dokey - feel free do to that whenever";
else 
	echo "dontknow";
fi


echo "Google Fonts is awesome - would you like to download and install them all? (use y for yes | use n for no)";
read FONT_ANSWER;
if ["$FONT_ANSWER" == "y"]; then
	echo "okay - building temp directory under your download folder, then download, then I'll remove that folder";
	mkdir -p ~/Downloads/temp_font;
	cd ~/Downloads/temp_font;
	wget --show-progress https://github.com/google/fonts/archive/master.zip;
	echo "downloaded - will extract now";
else
	echo "something";	
fi





