Portia_Installer_Script
=======================

Bash script that automates remote deployment of Portia Web Crawler. Tested on Ubuntu 14.04


I've only tested this on Digitalocean you can get an account
for no money down, and you only get charged by the hour. I have 5 websites on a single VPS, and only pay $5.00 a month.
You can get a 20GB SSD , static IP and plenty of Distro flavors with your choice of pre-installed
apps to choose from..

This script has only been tested to work on Ubuntu Server 14.04 - 64 bit

You can start an account instantly using: 

    http://bit.ly/digital-ocean-promotion

If you found this script useful please consider buying me a coffee as setting
this up originally from the original portia docs took me 20+ hours.. (don't ask why .. )


Here's the process...

Step 1.
Sign up for a Digital Ocean VPS, (your own fast server pick from several locations closest to you)

    http://bit.ly/digital-ocean-promotion

Once you've signed up and you are at your Control Panel, click CREATE (green button)
Choose a hostname , this can be anything or you can map it to a domain name you already have..
for now just put in portia or something..

Select size -- any of them work great you decide
Region 	-- Pick one closest to you
Select Image  --- For this we will be using Ubuntu 14.04 x64 stock build
(remember you can save snapshots of your server, destroy it at anytime or create as many as you like on the fly.)

    Select -- CREATE DROPLET (Green Button at the bottom)

Okay, awesome your droplet (vps) is being setup this takes about 30 seconds meanwhile if you are using windows
goto step 2.) otherwise skip step 2.) and goto step 3.)


Step 2.)
If you are running windows you need to download putty

You can search for it on google yourself or use ninite.com, here's the link http://bit.ly/putty-ssh-client
DigitalOcean also gives you a java console so you don't even need to download this if you are lazy.. 

Once your server is setup you will use putty to ssh into it the ip to your server is on your control panel, 

    the port is 22 , your first login will be 
    Username: root
    Password: check your email, they emailed it to you.


Step 3.)
Check your email for your IP address and password... 

login to your Droplet or Server or wtf ever you want to call it.. 

linux users open terminal and type

    ssh root@(your_ip_address) without the () Parentheses


The authenticity of host '.......... ' can't be established.
ECDSA key fingerprint is ......................
Are you sure you want to continue connecting (yes/no)? 

type yes and press enter.. this is normal for first connect..

enter your password

enter it again

put in a new password (remember your password)

4.) If you made it this far good job, now let's setup a user so we don't use root for everything..
copy / paste the following one line at a time into the terminal and press enter..

    useradd -d /home/portia -s /bin/bash -m portia 
    passwd portia 
    
(or make one up just remember to write it down)

enter a password for the user portia (remember your password)

    echo "portia ALL=(ALL) ALL" >> /etc/sudoers
    sudo aptitude install git

ok next thing to do for safe measure..

    type exit

then reconnect but this time using the name portia instead of root

    ssh portia@ip.address

and type the password you remembered


5.) You've successfully setup a user named portia with a password and you are logged in as that user, you know this because it says

    portia@(hostname_you_used_when_setting_up_the_droplet):~# 

We are going to setup the script...
copy / paste these commands..

    nano install_portia.sh

copy / paste this script of git clone it from this repo

    hit control + o then hit enter to save 
    hit control + x to exit

verify you copied the script by typing

    ls
    chmod +x install_portia.sh
    sudo ./install_portia.sh


hit ENTER or press Y when asked if you want to update etc... This is pretty fast so just chill or grab a brewsky,
considering this took me forever to get working originally, consider yourself luck you got an autopilot version...
