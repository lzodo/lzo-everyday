// 自除数 是指可以被它包含的每一位数整除的数。

// 例如，128 是一个 自除数 ，因为 128 % 1 == 0，128 % 2 == 0，128 % 8 == 0。
// 自除数 不允许包含 0 。

// 给定两个整数 left 和 right ，返回一个列表，列表的元素是范围 [left, right] 内所有的 自除数 。

// 来源：力扣（LeetCode）
// 链接：https://leetcode-cn.com/problems/self-dividing-number

/**
 * @param {number} left
 * @param {number} right
 * @return {number[]}
 */
var selfDividingNumbers = function (left, right) {
    // 构造一个left 到 right 的数组
    let list = new Array(right - left + 1).fill().map((v, i) => i + left);

    // 范围内的每个值,确定不包含0了,再判断每一项是否能整除每位
    return list.filter((v, i) => {
        let vlist = (v + "").split("");
        if (vlist.includes("0")) return false;
        return vlist.every((nv) => v % Number(nv) == 0);
    });
};

console.time();
console.log(selfDividingNumbers(10, 15));
console.timeEnd();
