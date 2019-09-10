// var arr = [1,2,3,4,5,6,7,8,9]

// function resetsort(arr,callback){
//     let newarr = [];
//     for(let i = 0; i < arr.length; i++){
//         setTimeout(() => {
//           newarr.push(arr[i]);
//           if(arr.length == newarr.length){
//              callback(newarr);
//           }
//         }, Math.floor(Math.random() * 1000)); // 打乱执行的时间,如果后面时间比前面时间小,就更早执行,起到乱序的作用
//     }
// }
// resetsort(arr,function(newarr){
//     console.log(newarr);
// });

// let fn = function test(){
//    console.log(test);
// };
// console.log(test);

// let a = {
//    value:0,
//    toString(){
//        this.value = this.value + 2;
//        return this.value
//    },
// }

let str = 'this-is-a-teststr';
function tuofeng(str){
    return str.split('-').map((item,index)=>{
       if(index == 0){
          return item;
       }else{
          return item.charAt(0).toUpperCase() + item.substr(1,item.length-1)
       }
    }).join('')
}
console.log(tuofeng(str))