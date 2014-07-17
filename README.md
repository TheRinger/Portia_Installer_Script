Portia_Installer_Script
=======================

Bash script that automates remote deployment of Portia Web Crawler. Tested on Ubuntu Server 14.04 curtosy of DigitalOcean VPS, only tested on Digitalocean. Testing and using web scrapers/crawlers can be done easily from a remote VPS and keep your home ip address from any initial jeopardy that ensues from learning how to scrape without overwhelming the host. Easily ssh and setup automation allowing access to a gui web frontend and dns routing to one of your domains. There is plenty of VPS Hosts out there so if you write something, msg me and I will link.

EndUser: 
"This script has only been tested to work on Ubuntu Server 14.04 - 64 bit, 20GB SSD, 512 Ram, image and repositories provided by DigitalOcean.com"

    http://bit.ly/digital-ocean-promotion

If you found this script useful, I like coffee, or even better teach me how to use it fluently.


Here's the process...

Step 1.
Sign up for a Digital Ocean VPS.
http://bit.ly/digital-ocean-promotion

Signed up and you are at your at your DO Control Panel, click CREATE (Green Button)
Choose a hostname , this can be anything or you can map it to a domain name you already have..
for now just put in portia..

Select size   --- any of them work great you decide
Region 	      --- Pick one closest to you for faster ping
Select Image  --- For this we will be using Ubuntu Server 14.04 x64 (No pre-install APPS)

    Select -- CREATE DROPLET (Green Button at the bottom)

Okay, awesome your droplet (vps) is being setup this takes about 30 seconds meanwhile if you are using windows
goto step 2.) otherwise skip step 2.) and goto step 3.)


Step 2.)
If you are running windows you need to download putty

You can search for it on google yourself or use ninite.com, here's the link http://bit.ly/putty-ssh-client
DigitalOcean also gives you a java console so you don't even need to download this.. 

Once your server is setup you will use putty to ssh into it, the ip address to your server is on your control panel,



    the port is 22 , your first login will be 
    Username: root
    Password: check your email, they emailed it to you.


Step 3.)
Check your email for your IP address and password... 

Login to your VPS

Linux users open terminal and type

    ssh root@(your_vps_ip_address) without the () Parentheses


-------------------------------------------------------------------
The authenticity of host '.......... ' can't be established.
ECDSA key fingerprint is ......................
Are you sure you want to continue connecting (yes/no)? 
-------------------------------------------------------------------

    Type YES and press enter.. this is normal for first connect..
    Enter your password
    Enter it again
    Put in a new password (remember your password)

4.) If you made it this far good job, now let's setup a user so we don't use root for everything..
copy / paste the following one line at a time into the terminal and press enter..

    Please note: in order for this script to work you must use the username portia you can change the password to whatever you like
        useradd -d /home/portia -s /bin/bash -m portia 
        passwd portia 
    
(or make one up.)

    enter a password for the user portia (remember your password)

Copy paste these commands one line at a time.

    echo "portia ALL=(ALL) ALL" >> /etc/sudoers
    sudo aptitude install git
    exit

Then reconnect but this time using the name "portia" instead of root.

    ssh portia@(ip.address.of.vps)

and type the password you remembered


5.) You've successfully setup a user named portia with a password and you are logged in as that user, you know this because it says

    portia@(hostname_you_used_when_setting_up_the_droplet):~# 

We are going to setup the script...
copy / paste these commands..

    nano install_portia.sh

copy / paste this script of git clone it from this repo found at this link:

    https://github.com/tytek2012/Portia_Installer_Script.git
    
After pasting into nano on the vps you can save it by:

    hit control + o then hit enter to save 
    hit control + x to exit

verify you copied the script by typing

    ls
    
Make the script executable then run it.

    chmod +x install_portia.sh
    sudo ./install_portia.sh


hit ENTER or press Y when asked if you want to update etc... This is pretty fast so just chill or grab a brewsky, I've been messing with this to pull jobs off local jobs boards and classifieds. If you build an interesting scraper please consider sharing it.
