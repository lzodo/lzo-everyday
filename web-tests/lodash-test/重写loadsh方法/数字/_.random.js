/**
 * lodash 方法
 * 产生一个包括 lower 与 upper 之间的数。
 *  _.random([lower=0], [upper=1], [floating])  floating是否包含小数
 */

let _ = require("lodash");
console.log(_.random(10, 5, false));

/**
 * 实现
 *
 */

let m_random = (lower, upper, floating) => {
    let [lo, up] = upper > lower ? [lower, upper] : [upper, lower];
    let res = Math.random() * (up - lo) + lo;
    return floating ? res : Math.floor(res);
};
console.log(m_random(10, 5));
