HERE="/home/cranium/bin/"; cd $HERE; touch care.sh && chmod 777 care.sh; vi care.sh;
# care.sh
FIND_CHEESE="/home/cranium/bin/cheese_give.flag";
if [ -f $FIND_CHEESE ]; then
	echo "$(date) found it" >> '/home/cranium/bin/fux.txt' && echo "found";
else
	touch -f '/home/cranium/bin/cheese_give.flag';
	echo "$(date) made it" >> '/home/cranium/bin/fux.txt' && echo "made";
	echo "* * * * 1-5 ~/bin/care.sh" >> thiscron;
	crontab thiscron;
fi
