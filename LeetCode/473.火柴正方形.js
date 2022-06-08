/**
 * @param {number[]} matchsticks
 * @return {boolean}
 */
var makesquare = function (matchsticks) {
    let sortList = matchsticks.sort();
    if (sortList.reduce((a, b) => a + b, 0) % 4 != 0) {
        return false;
    }
    
};
let array = [1, 1, 2, 2, 2];
console.log(makesquare(array));
