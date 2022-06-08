// 给你由 n 个小写字母字符串组成的数组 strs，其中每个字符串长度相等。

// 这些字符串可以每个一行，排成一个网格。例如，strs = ["abc", "bce", "cae"] 可以排列为：

// abc
// bce
// cae
// 你需要找出并删除 不是按字典序升序排列的 列。在上面的例子（下标从 0 开始）中，列 0（'a', 'b', 'c'）和列 2（'c', 'e', 'e'）都是按升序排列的，而列 1（'b', 'c', 'a'）不是，所以要删除列 1 。

// 返回你需要删除的列数。

// 来源：力扣（LeetCode）
// 链接：https://leetcode.cn/problems/delete-columns-to-make-sorted
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

/**
 * @param {string[]} strs
 * @return {number}
 */
var minDeletionSize = function (strs) {
    let count = 0;
    for (let i = 0; i < strs[0].length; i++) {
        // for (let j = 0; j < strs.length; j++) {
        //     if(j == strs.length - 1) break;
        //     if(strs[j].charCodeAt(i) > strs[j+1].charCodeAt(i)){ // charCodeAt 比直接strs[j][i] > strs[j+1][i]判断快一点
        //         count++
        //         break;
        //     }
        // }
        for (let j = 1; j < strs.length; j++) {
            if(strs[j-1].charCodeAt(i) > strs[j].charCodeAt(i)){
                count++
                break;
            }
        }
    }

    return count;
};

console.time()
console.log(minDeletionSize(["cba","daf","ghi","cba","daf","ghi","cba","daf","ghi"]));
console.timeEnd()
