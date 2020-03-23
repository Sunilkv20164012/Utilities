#!/bin/bash


#nc hackthisfor.me 4001 | {
#while IFS= read -r line <&3; do
#    echo "$line"
#    echo $(( $line )) >&3
#  done
#} 3<>/dev/tcp/hackthisfor.me/4001


exec 3<>/dev/tcp/hackthisfor.me/4002;
head -1 <&3 | { read test; echo $(( $test )); } | awk '{print $1}' >&3;
#head -1 <&3 | echo $(( $1 )) | awk '{print $1}' >&3;
cat <&3
