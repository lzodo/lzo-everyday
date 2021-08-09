#!/bin/bash

# 求一千以内的质数(只能被1和他自身整除的数，不包括1)

for((i=2;i<1000;i++))
do

done




# static void algor1(){
#     int i,j,mark;
#     for(i = 2; i < 100; i++){
#         mark = 1;
#         for(j = 2; j < i/2; j++){
#             if(i%j==0){
#                 if(i!=j){//可省略，不可能相等
#                     mark = 0;
#                     break; //跳出第二个for
#                 }
#             }
#         }
#         if(mark == 1)
#             printf("%d\n",i);
#     }
# }
# 
# //删除法求1000以内质数
# static void algor2(){
#     int i;
#     //定义一个长度为1001，下标为0-1000，的数组，并初始化为0
#     char arr[1001] = {0};
#     for(i=2;i<1001;i++){
#         if(arr[i] == 0){ //为0，初始值，表示没被删除
#             //从小大大，一千以内，只要下标为当前下标的倍数，就不是质数，赋值-1表示删除
#             for(int j=i+i;j<1001;j+=i){
#                 arr[j] = -1; //非0表示删除   
#             }
#         }
#     }
# 
#     //与下标一一对应，所以没有变化值对应的下标就是质数
#     for(i=2;i<1001;i++){
#         if(arr[i]==0){
#             printf("%d\n",i);
#         }
#     }
# 
#         
# }
# 
# int main(){
#    // algor1();
#     algor2();
# }
