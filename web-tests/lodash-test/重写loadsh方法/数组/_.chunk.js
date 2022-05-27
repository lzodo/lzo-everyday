
/**
 * lodash 方法
 * 按指定长度拆分数组
 *
 */

let _ = require("lodash");
let array = [1, 2, 3, 4, 5];
console.log(_.chunk(array, 2)); //[ [ 1, 2 ], [ 3, 4 ], [ 5 ] ]

/**
 * 实现
 * 按指定长度拆分数组
 *
 */
const m_chunk = (array, size) => {
    let sub = [],
        res = [];
    array.map((item, index) => {
        if (sub.length < size) {
            sub.push(item);
        } else {
            res.push(sub);
            sub = [item];
        }

        if (index == array.length - 1) {
            res.push(sub);
        }
    });

    return res;
};
console.log(m_chunk(array, 2));
