#!/bin/(shell)
isconnect=`ping -c 1 -q google.com >&/dev/null; echo $?` 
if [[ $isconnect != 0 ]] 
	then
    	echo "Not connected to internet"
    	return
fi

ip_old=`cat README.md` 
(curl ifconfig.me && echo ) > README.md
ip_new=`cat README.md`

if [ $ip_old != $ip_new ] 
	then
    	git add README.md
    	git commit -m $ip_new
    	git push
fi