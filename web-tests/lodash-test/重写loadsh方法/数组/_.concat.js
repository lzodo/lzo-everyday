/**
 * lodash 方法
 * 创建一个新数组，将array与任何数组 或 值连接在一起。
 *
 */

const { isArray, concat } = require("lodash");
let _ = require("lodash");
let array = [0, 1, 2, 3, 4, 5];
console.log(_.concat(array, 1, [2], [[3]], [[[4]]]));

/**
 * 实现
 *
 */

let m_concat = (...arg) => {
    // 1、扁平化 flat
    return arg.flat(Infinity)

    // 2、reduct
    // if (arg.length == 1) {
    //     arg = arg[0];
    // }
    // return arg.reduce((a, next) => {
    //     return a.concat(Array.isArray(next) ? m_concat(next) : next);
    // }, []);

    // 3、正则
    // return JSON.stringify(arg).replace(/\[|\]/g,"").split(",");

    // 4、数值变字符串，并将字符串数值变为number， arg+"" 一样
    // return arg.toString().split(",").map((item) => (/^\d+$/.test(item) ? Number(item) : item));

    // 5、while some
    // while (arg.some((item) => Array.isArray(item))) {
    //     arg = [].concat(...arg);
    // }
    // return arg;
};
console.log(m_concat(array, 1, [2], [[3]], [[[4]]]));
