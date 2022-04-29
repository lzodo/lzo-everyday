// 请实现整数数字的乘法、减法和除法运算，运算结果均为整数数字
// 程序中只允许使用加法运算符和逻辑运算符,允许程序中出现正负常数，不允许使用位运算。

// 你的实现应该支持如下操作：

// Operations() 构造函数
// minus(a, b) 减法，返回a - b
// multiply(a, b) 乘法，返回a * b
// divide(a, b) 除法，返回a / b

// 来源：力扣（LeetCode）
// 链接：https://leetcode-cn.com/problems/operations-lcci

var Operations = function () {};

/**
 * @param {number} a
 * @param {number} b
 * @return {number}
 */
Operations.prototype.minus = function (a, b) {
    // // + || && ! ..
    // let ma = abs(a),mb=abs(b);
    // let aList = new Array(a).
    var c, d, e;
    try {
        c = a.toString().split(".")[1].length;
    } catch (f) {
        c = 0;
    }
    try {
        d = b.toString().split(".")[1].length;
    } catch (f) {
        d = 0;
    }
    return (
        (e = Math.pow(10, Math.max(c, d))), (this.multiply(a, e) - this.multiply(b, e)) / e
    );
};

/**
 * @param {number} a
 * @param {number} b
 * @return {number}
 */
Operations.prototype.multiply = function (a, b) {
    var c = 0,
        d = a.toString(),
        e = b.toString();
    try {
        c += d.split(".")[1].length;
    } catch (f) {}
    try {
        c += e.split(".")[1].length;
    } catch (f) {}
    return (
        (Number(d.replace(".", "")) * Number(e.replace(".", ""))) /
        Math.pow(10, c)
    );
};

/**
 * @param {number} a
 * @param {number} b
 * @return {number}
 */
Operations.prototype.divide = function (a, b) {
    var c, d, e = 0,
            f = 0;
        try {
            e = a.toString().split(".")[1].length;
        } catch (g) {
        }
        try {
            f = b.toString().split(".")[1].length;
        } catch (g) {
        }
        return c = Number(a.toString().replace(".", "")), d = Number(b.toString().replace(".", "")), this.multiply(c / d, Math.pow(10, f - e));
};

/**
 * Your Operations object will be instantiated and called as such:
 * var obj = new Operations()
 * var param_1 = obj.minus(a,b) -
 * var param_2 = obj.multiply(a,b) *
 * var param_3 = obj.divide(a,b)   /
 */

var obj = new Operations();
// var param_1 = obj.minus(1.4, 2.1);
var param_2 = obj.multiply(2, 2.5);
// var param_3 = obj.divide(1, 2);
// console.log(param_1);
// console.log(param_2);
// console.log(param_3);
