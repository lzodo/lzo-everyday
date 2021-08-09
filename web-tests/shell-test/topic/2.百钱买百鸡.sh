#！/bin/bash

# 鸡翁一，5钱;鸡母一，3钱；3鸡雏，1钱；--- 若要百钱买百级，翁母雏各几只？

count=100
countPrice=100

for((i=0;i<count/5;i++))
do
    for((j=0;j<count/3;j++))
    do
        k=$[${count}-${j}-${i}]   
        if [ $[${k}%3] -eq 0 ]
        then
            if [ $[${i}+${j}+${k}] -eq ${count} -a $[${i}*5+${j}*3+${k}/3] -eq ${countPrice} ]
            then
                echo 鸡翁:${i}只，鸡母:${j}只，鸡雏：${k}只
            fi
        fi
    done
done
