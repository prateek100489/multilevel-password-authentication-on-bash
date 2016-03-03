# multilevel-password-authentication-on-bash

This is a shell script which can be added to .profile/.bash/.cshrc/.login OR used at the start of any another script . Once this is called , it will ask user to setup (firstime)  and login into account. Once the password is set, user must have to provide right password to pass authentication . 

If this authentication fails, user will have to do reattemt. Script will not exit unless correct password is provided. So if you want to prevent user to get access to your shell,if he knows your password then this script can be used. 


Important points: 

1. Inttrupts like "CTRL + c , CTRL +Z , CTRL + \ " will not close this script. This script will not respond to it. 
2. Script will never store your password in any location. It will hash the pasword using md5sum. 


 

