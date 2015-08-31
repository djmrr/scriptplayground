#!/bin/bash
##ssh_script
clear;
find ~/.ssh | grep id_rsa.pub &> ~/Documents/temp_ssh_area.txt;
echo "looked to see if I could find the ssh key"; 
head ~/Documents/temp_ssh_area.txt;
echo "error or none - lets get this done"; 
THISSSHISHERE=`head ~/Documents/temp_ssh_area.txt`;
echo "$THISSSHISHERE";
echo "now I'm gonna copy your ssh to the clipboard";
pbcopy < "$THISSSHISHERE";
echo `pbpaste`;
##should of echoed the ssh key above 
echo "okay should be finished - should be able to paste with your paste commands";
echo "this hasn't been optimized for anything besides mac installs";
echo "if you have mac and you didn't see anything paste or you had errors";
echo "you'll need to generate an ssh key";
echo "until I figure out how to generate said ssh keys via scripting";
echo "please visit: https://help.github.com/articles/generating-ssh-keys/";
echo "would you like to go there now?(use y for yes | use n for no)";
read THE_ANSWER;
##Starting conditional below 
if [ "$THE_ANSWER" == "y" ]; then
open "https://help.github.com/articles/generating-ssh-keys";
elif [ "$THE_ANSWER" == "n" ]; then
echo "alrighty suit yourself - exiting";
exit 1;
else
echo "don't understand input - plz re run script - exiting";
exit 2; 
fi

