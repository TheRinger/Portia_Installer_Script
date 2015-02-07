#!/bin/bash
#In order for this script to work you need to add the user as portia
#script for installing portia on remote server
#Tested to be working on Ubuntu 14.04 new DigitalOcean Deployment
#Get an Account no money down for 5$ a month, static IP, SSD.
#All credit goes to Scrapinghub for portia, they offer an online service that allows you tons of unlimited scraping and
#support for very cheap.. check them out at http://scrapinghub.com/ or on github at https://github.com/scrapinghub
#Please feel free to improve this script as you see fit but leave original credit to me @ http://ty-tek.net
#Anyone that feels like buying me a coffee you can paypal it to tytek2012@gmail.com
#You can find me on irc.freenode.net as TheRinger come visit channel #scrapy 
#Also I know my coding skills suck ok genius.. :)

cd
CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
if [ ${CAN_I_RUN_SUDO} -gt 0 ]
then
echo "You can run the Sudo Command"
else
echo "You cannot run the Sudo command"
fi
clear;
echo "Starting updates first...."
sudo aptitude update && aptitude install curl git git-core python-pip python-dev toilet libxml2-dev libxslt1-dev libffi-dev libssl-dev && toilet -f mono12 -t --gay Updates Done && aptitude upgrade && toilet -f mono12 -t --gay Upgrades Done && aptitude dist-upgrade && toilet -f mono12 -t --gay Distro Upgraded
echo "Updates finished, installing requirements...."

sudo pip install virtualenv

sudo git clone https://github.com/scrapinghub/portia.git
virtualenv portia --no-site-packages
#source ~/portia/bin/activate
cd ~/portia/slyd/
sudo ln -s ~/portia/src ~/portia/slyd/
echo "-------------  Installing Portia Requirements ---------------"

#alias activate=". ~/portia/bin/activate"

sudo chown -R portia:portia ~/portia

cd ~/portia/slyd/
~/portia/bin/pip install service_identitycd
~/portia/bin/pip install -r requirements.txt

echo "-------------  Getting your Ip Address ---------------"
sudo rm myip
echo "disregard this error just cleaning up the old myip file.."                                                                                        
sudo curl -s echoip.com > myip                                                                                         
echo "========== Your IP Address is the file (myip) in the DIRECTORY ========="
ipstring=$(cat myip)
echo $ipstring
toilet -f mono12 -t --gay $ipstring
echo "Would you like to start the portia web interface now?"

choice=3

        echo "1. Yes Start the Portia Web Interface Now.."
        echo "2. No I will run ( twistd -n slyd ) myself.."
        echo -n "Please choose: [1, or 2] "
while [ $choice -eq 3 ]; do

read choice

if [ $choice -eq 1 ] ; then

        echo "Starting Portia now...."
        
        ipstring=$(cat myip)
                echo $ipstring
                echo "Your Ip Address is ...... "
                toilet -f mono12 -t --gay $ipstring

                sleep 5

                echo "You should now be able to open Portia at this address..."
                echo "********************************************************"
                echo "********************************************************"
                echo "http://"$ipstring":9001/static/main.html"
        echo "********************************************************"
        echo "********************************************************"
        cd ~/portia/slyd/
        ~/portia/bin/twistd -n slyd


else

        if [ $choice -eq 2 ] ; then
                echo "Awesome, direct feedback to tytek2012 @ github.com"
        fi

        #       echo "Please choose 1 or 2 !"
        #       echo "1. Yes Start Portia for f%$ck sake.."
        #       echo "2. Get me outa here you imbecile..."
        #       echo -n "Please choose an option [1 or 2]? "
        #       choice=3
fi

echo "You can start Portia on your own by typing ./portia_startup"
echo "From your home dir... "
echo "Hope this saved you some time..."
echo "http://"$ipstring":9001/static/main.html"
echo "To start portia in the future use type ./The_Ringer.script from your home dir..."
toilet -f mono12 -t --gay 
done
