#!/bin/bash

# getopts 比 getopt简介 但是好像只能用单个字符的短选项,getopts 可以用长选项和双杆

# l 后面没有冒号 不能跟随值
# v 后面一个冒号 值必填
# xx.sh -l -v 1 -h 2 -p 3
# xx.sh -lv 1 -h 2 -p 3
while getopts "v:h:p:l" OPT
do
    case $OPT in
        l) echo "选项 $OPT 值 $OPTARG";;
        v) echo "选项 $OPT 值 $OPTARG 下一个要处理参数索引 $OPTIND";;
        h) echo "选项 $OPT 值 $OPTARG";;
        p) echo "选项 $OPT 值 $OPTARG";;
        *) echo "otheiaaa";;
    esac
done
