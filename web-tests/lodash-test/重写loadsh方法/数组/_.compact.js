
/**
 * lodash 方法
 * 创建一个新数组，包含原数组中所有的非假值元素。例如false, null,0, "", undefined, 和 NaN 等
 *
 */

let _ = require("lodash");
let array = [0,1,2,3,4,5,false,null,"",undefined,NaN];
console.log(_.compact(array))



/**
 * 实现
 *
 */

const m_compact = (array) => {
    let list = [];
    array.forEach(i => {
        if(i){
            list.push(i)
        }
    });
    return list;

    // return array.filter((item)=> item); //ES6
}

console.log(m_compact(array))
