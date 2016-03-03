#!/bin/bash
##########################################################################################
#Security script : This could be added to any other script to add password authentication.
#Author: 
##########################################################################################
resetFunction()
{

    test -f /home/`whoami`/.personal/sceurityFlag
    if [ "$?" != "0" ] ;then
     echo "Password is not set, cannot update password."
     exit 1
     fi
   storedPassword=$(cat /home/`whoami`/.personal/sceurityFlag)
  read -s -p "Enter Existing Password: " mypassword5
    mypassword5=$(echo $mypassword5|md5sum)
    if [ "$mypassword5" != "$storedPassword" ];then
        echo "Incorrect password, Exiting...."
        exit 1
    fi
    echo ""
    read -s -p "Enter new Password: " mypassword3
   echo ""
   read -s -p "Re-Enter new Password: " mypassword4
   echo ""
   if [ "$mypassword3" == "$mypassword4" ];then
       rm -rf /home/`whoami`/.personal/sceurityFlag
      mkdir -p /home/`whoami`/.personal/
       touch /home/`whoami`/.personal/sceurityFlag
       echo $mypassword4|md5sum > /home/`whoami`/.personal/sceurityFlag
        else
       echo "Two password entered did not match.Exiting...."
        exit 1;
   fi
    echo "Password updated."
}

### turning off any possible way to inttrupt the script from keyboard.

if [ "$#" == "0" ];then
trap '' 1
trap '' 2
trap '' 3
trap '' 4
trap '' 5
trap '' 6
trap '' 7
trap '' 8
trap '' 9
trap '' 10
trap '' 11
trap '' 12
trap '' 13
trap '' 14
trap '' 15
trap '' 16
trap '' 17
trap '' 18
trap '' 19
trap '' 20
trap '' 21
trap '' 22
trap '' 23
trap '' 24
trap '' 25

### If the user is using this script for first time then setup for password.

echo -e "Welcome to My home directory"

test -f "/home/`whoami`/.personal/sceurityFlag"
if [ "$?" != "0" ];then
    echo "Please set up your password:"
    read -s -p "Enter New Password: " mypassword1
    echo ""
    read -s -p "Enter New password again: " mypassword2
    echo ""
    if [ "$mypassword1" != "$mypassword2" ];then
        echo "Two password entered did not match.Exiting..."
        exit 1;
    fi
    mkdir -p /home/`whoami`/.personal/
    touch /home/`whoami`/.personal/sceurityFlag

    echo $mypassword1 |md5sum > /home/`whoami`/.personal/sceurityFlag
    echo -e "Password is set now. Enter password to login."
fi



### If this user is using the script not for first time then simply ask for password.And keep asking till right password is not given

while true
    do
storedPassword=$(cat /home/`whoami`/.personal/sceurityFlag)

read -s -p "Enter Password: " mypassword
 newPassword=$(echo $mypassword |md5sum)
echo ""
if [ "$newPassword" == "$storedPassword" ];then
    echo "Password matched"
    exit 0;
fi
    done


fi



if [ "$#" != "0" ];then

case "$1" in
"-reset")
resetFunction
;;
*)
echo "You have failed to specify what to do correctly."
exit 1
;;
esac


    fi
