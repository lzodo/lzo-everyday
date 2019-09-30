

var twoSum = function (nums, target) {
    let ind = [];
    nums.map((it1, in1) => {
        nums.map((it2, in2) => {
            if (in1 != in2 && it1 + it2 == target) {
                ind = [in1, in2]
            }
        })
    })
    return ind.sort((a, b) => a - b);
};
console.log(twoSum([2, 7, 11, 15], 22));
