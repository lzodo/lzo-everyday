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

function addEvent(node, type, handler) {
    if (!node) return false;
    if (node.addEventListener) {
        node.addEventListener(type, handler, false);
        return true;
    } else if (node.attachEvent) {
        node["e" + type + handler] = handler;
        node[type + handler] = function () {
            node["e" + type + handler](window.event);
        };
        node.attachEvent("on" + type, node[type + handler]);
        return true;
    }
    return false;
}

function removeEvent(node, type, handler) {
    if (!node) return false;
    if (node.removeEventListener) {
        node.removeEventListener(type, handler, false);
        return true;
    } else if (node.detachEvent) {
        node.detachEvent("on" + type, node[type + handler]);
        node[type + handler] = null;
    }
    return false;
}

e.stopPropagation(); //阻止事件冒泡
e.preventDefault(); //阻止默认事件
