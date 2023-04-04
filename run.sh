isconnect=`ping -c 1 -q google.com >&/dev/null; echo $?` 
if [[ $isconnect != 0 ]] 
	then
    	echo "Not connected to internet"
    	return
fi

ip_old=`cat ip.config` 
(curl ifconfig.me && echo ) > ip.config
ip_new=`cat ip.config`

if [ $ip_old != $ip_new ] 
	then
    	git add README.md
    	git commit -m $ip_new
    	git push
fi