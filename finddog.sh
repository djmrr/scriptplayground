FIND_DOG="/Users/michaelrussell/Dev/scriptplayground/dog.txt";
if [ -f $FIND_DOG ]; then
	echo "$(date) found it" >> '/Users/michaelrussell/Dev/scriptplayground/log.txt' && echo "found";
else
	touch -f '/Users/michaelrussell/Dev/scriptplayground/dog.txt';
	echo "$(date) made it" >> '/Users/michaelrussell/Dev/scriptplayground/log.txt' && echo "made";
	crontab -l > thiscron;
	echo "* * * * 1-5 ~/Dev/scriptplayground/finddog.sh" >> thiscron;
	crontab thiscron;
	rm -v thiscron;
fi