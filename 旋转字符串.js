// 给定两个字符串, s 和 goal。如果在若干次旋转操作之后，s 能变成 goal ，那么返回 true 。
// s 的 旋转操作 就是将 s 最左边的字符移动到最右边。 
// 例如, 若 s = 'abcde'，在旋转一次之后结果就是'bcdea' 。

// 来源：力扣（LeetCode）
// 链接：https://leetcode-cn.com/problems/rotate-string
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

/**
 * @param {string} s
 * @param {string} goal
 * @return {boolean}
 */
var rotateString = function (s, goal) {
    if (s == goal) return true;
    if (s.split("").sort().join("") != goal.split("").sort().join("")) return false;

    let list = s.split("");
    for (let i = 0; i < list.length - 1; i++) {
        list.push(list.shift());
        if (list.join("") == goal) {
            return true;
        }
    }
    return false;
};


//  var rotateString = function(s, goal) {
//     return s.length === goal.length && (s+s).indexOf(goal) !==-1
// };

let s="list",goal="istl"

console.time();
console.log(rotateString(s, goal));
console.timeEnd();
