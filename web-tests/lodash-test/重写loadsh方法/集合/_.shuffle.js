/**
 * lodash 方法
 * 数组乱序
 *
 */

let _ = require("lodash");
let array = [1, 2, 3, 4, 5, 6, 7, 8];

// console.log(_.shuffle(array));

/**
 * 实现
 * 数组乱序
 *
 */

let m_shuffle = (array) => {
    return array.sort((a, b) => Math.random() - 0.5);
};
console.log(m_shuffle(array));
