/**
 * @param {number[]} nums
 * @return {number[]}
 */
var sortArrayByParity = function (nums) {
    return nums.filter(item => item % 2 == 0).concat(nums.filter((item) => item % 2 == 1));
};

console.time();
console.log(sortArrayByParity([1, 2, 3, 4, 5, 6,7,8]));
console.timeEnd();
