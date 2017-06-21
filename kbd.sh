#!/bin/sh

setxkbmap -layout 

#set terminate key unless already set

setxkbmap -query |grep -q terminate

if [ $? != 0 ]; then
setxkbmap -option terminate:ctrl_alt_bksp
fi

exit
 
