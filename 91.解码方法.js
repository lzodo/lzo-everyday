// 一条包含字母 A-Z 的消息通过以下映射进行了 编码 ：

// 'A' -> "1"
// 'B' -> "2"
// ...
// 'Z' -> "26"
// 要 解码 已编码的消息，所有数字必须基于上述映射的方法，反向映射回字母（可能有多种方法）。例如，"11106" 可以映射为：

// "AAJF" ，将消息分组为 (1 1 10 6)
// "KJF" ，将消息分组为 (11 10 6)
// 注意，消息不能分组为  (1 11 06) ，因为 "06" 不能映射为 "F" ，这是由于 "6" 和 "06" 在映射中并不等价。

// 给你一个只含数字的 非空 字符串 s ，请计算并返回 解码 方法的 总数 。

// 题目数据保证答案肯定是一个 32 位 的整数。

//

// 来源：力扣（LeetCode）
// 链接：https://leetcode.cn/problems/decode-ways
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

/**
 * @param {string} s
 * @return {number}
 */
var numDecodings = function (s) {
    // console.log(String.fromCharCode(64+1))
    let obj = new Array(String(s).length).fill().map((item, i) => {
        return { val: Number(String(s)[i]), use1: 0, use10: 0 };
    });

    let char = [];
    for (let i = 0; i < obj.length; i++) {
        console.log(obj[i] + obj[i + 1]);
        if (obj[i].use1 == 0) {
            if (i == obj.length - 1 && obj[i].val != 0) {
                char.push(String.fromCharCode(64 + obj[i].val));
                obj[i].use1++;
            } else {
                if (obj[i].val != 0 && obj[i + 1].val != 0) {
                    char.push(String.fromCharCode(64 + obj[i].val));
                    obj[i].use1++;
                } else if (
                    (obj[i].val == 1 && obj[i + 1].val == 0) ||
                    (obj[i].val == 2 && obj[i + 1].val == 0)
                ) {
                    char.push(
                        String.fromCharCode(64 + Number(obj[i].val + "0"))
                    );
                    obj[i].use1++;
                }
            }
        }
    }
    console.log(char, 100);
    console.log(obj);
    for (let i = 0; i < obj.length - 1; i++) {
        if (obj[i].val != 0 && obj[i].val + "" + obj[i + 1].val <= 26) {
            let num = obj[i].val + "" + obj[i + 1].val;
            console.log(num);
            // char.push(String.fromCharCode(64 + obj[i].val));
            // obj[i].use1 ++
        }
    }
};
// var numDecodings = function(s) {
//     const n = s.length;
//     const f = new Array(n + 1).fill(0);
//     f[0] = 1;
//     for (let i = 1; i <= n; ++i) {
//         if (s[i - 1] !== '0') {
//             f[i] += f[i - 1];
//         }
//         if (i > 1 && s[i - 2] != '0' && ((s[i - 2] - '0') * 10 + (s[i - 1] - '0') <= 26)) {
//             f[i] += f[i - 2];
//         }
//     }
//     return f[n];
// };

console.log(numDecodings("226"));

// let searchMiddle = function (arrs, limits) {
//     // let allList = {list1:[]};
//     let list  =[];
//     arrs = arrs.sort();
//     for (let i = 1; i < arrs.length; i++) {
//         if (Math.abs(arrs[i] - arrs[i - 1]) < limits) {
//             if (list.length != 0 && Math.abs(arrs[i] - list[0]) > 31) {
//                 // allList.push(new Array(list));
//                 // console.log(list);
//                 console.log([].concat(list))
//                 list = [];
//             }else{
//                 list.push(arrs[i]);
//             }
//         }
//     }

//     // console.log(allList);
// };

// searchMiddle(
//     [
//         222, 218, 225, 80, 300, 217, 224, 226, 1000, 1002, 999, 3, 215, 229,
//         238, 247,
//     ],
//     10
// );
// 12 => 12 2
// 123 => 123 12+3 1+23 3
// 1234 => 1234 1+23+4 1+2+34 12+3+4 12+34 5
// 12345 => 12345
