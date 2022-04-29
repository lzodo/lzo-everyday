/**
 * @param {number} x
 * @param {number} n
 * @return {number}
 */

//  var myPow = function (x, n) {
//     if(n == 0) return 1;
//     let res = x;
//     for (let i = 1; i < Math.abs(n); i++) {
//         res *= x;
//     }
//     return n < 0 ? 1 / res : res;
// };
var myPow = function (x, n) {
    if (n == 0) return 1;
    let res = x;
    // for (let i = 1; i < Math.abs(n); i++) {
    //     res *= x;
    // }
    res = n > 0 ? res << Math.abs(n - 1) :"xxx";
    return res;
};

console.time();
console.log(myPow(2.00000,-2147483648));
console.log(Math.pow(2.0, -2));
console.timeEnd();
