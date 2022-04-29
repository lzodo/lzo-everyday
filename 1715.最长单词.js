/*
给定一组单词words，编写一个程序，找出其中的最长单词
    且该单词由这组单词中的其他单词组合而成。(其他单词可以重复 ["ccc","c"] => true)
    若有多个长度相同的结果，返回其中字典序最小的一项 (题目没讲清楚好像是去更后面的)
    若没有符合要求的单词则返回空字符串。
    （题目没讲清楚 如果最长的不是由其他单词组成，需要找第二长的）

*/
// 来源：力扣（LeetCode）
// 链接：https://leetcode-cn.com/problems/longest-word-lcci

/**
 * @param {string[]} words
 * @return {string}
 *
 * 字典序最小的一项 (指的是返回相同长度更后面的)
 * 若最长的没有符合要求的单词则要找第二长的。
 *  感觉题目好多坑
 */

 var longestWord = function (words) {
    if(words.length == 1) return "";
    let rwords = words.sort((a, b) => b.length - a.length),
        maxWords = [],minWords=[];

    if (rwords[0].length != rwords[1].length) {
        minWords = rwords.filter((item) => item != rwords[0]);
        return visWords(rwords[0], minWords) ? rwords[0]: minWords.length > 1 ? longestWord(minWords): "";
    } else {
        maxWords = rwords.filter((item) => item.length == rwords[0].length).reverse();
        minWords = rwords.filter((item) => item.length != rwords[0].length);
        for (let i = 0; i < maxWords.length; i++) {
            if (visWords(maxWords[i], rwords.filter((item) => item != maxWords[i]))) {
                return maxWords[i];
            }
        }
        return minWords.length > 1 ? longestWord(minWords): "";
    }
};

var visWords = function (words, list) {
    // 注意list只有一位时 "ccc" ["c"]
    // return new RegExp(`^(${list.join("|")}){2,${list.length <= 1 ? 2:list.length}}$`).test(words)
    return new RegExp(`^(${list.join("|")}){2,}$`).test(words)
};

console.time();
// ["mbzznzbccc","zbmcbbcbze","cbz","cbzcbz"] => cbzcbz
// ["qlmql","qlmqlmqqlqmqqlq","mqqlqmqqlqmqqlq","mqqlq","mqqlqlmlsmqq","qmlmmmmsm","lmlsmqq","slmsqq","mslqssl","mqqlqmqqlq"] => mqqlqmqqlqmqqlq
// ["llllcccl","clclll","ccc","llccllccl","lcclccclcl","c"]
console.log(
    longestWord(["llllcccl","clclll","ccc","llccllccl","lcclccclcl","c"])
);
console.timeEnd();
