var twoSum = function (nums, target) {
    let ind = [];
    nums.map((it1, in1) => {
        nums.map((it2, in2) => {
            if (in1 != in2 && it1 + it2 == target) {
                ind = [in1, in2];
            }
        });
    });
    return ind.sort((a, b) => a - b);
};
console.log(twoSum([2, 7, 11, 15], 22));

//================================================

let travelPlans = {
    destination: "DC",
    monday: {
        location: "National Mall",
        budget: 200,
        host: null,
    },
};
let res = travelPlans?.tuesday?.location ?? "locahost"; // => locahost
let res2 = travelPlans?.host; // => undefined

// (?=(p)) 匹配找到 符合p子模式 前面的 那个位置
console.log("18060849356".replace(/(?=(\d{4})+$)/g, "-"));
console.log("18060849356".replace(/(?!^)(?=(\d{3})+$)/g, "-"));

// const str = "1021-10-24gg";
// const r1 = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
// const exec = r1.exec(str);
// console.log(exec)

let str = "e=pow;d=555;22r5";
let reg = /(?=(.*d=\d{3,};.*))(\w+=\w+;){2,}(\w{4})?$/;

// console.log(reg.test(str));

let strb = "222 hello123 word123 123 456";
strb.replace(/([a-z]{1,})([0-9]+)/g, (a, b, c, d) => {
    // console.log('======')
    // console.log(a)
    // console.log(b)
    // console.log(c)
    // console.log(d)
    // console.log('======')
});

//======================

/**
 * @param {string} s
 * @return {string}
 */
// function longestPalindrome(s) {
//     let res = "";
//     for (let i = 0; i < s.length; i++) {
//         // 寻找长度为奇数的回文子串(以当前元素向两边扩散)
//         const s1 = palindrome(s, i, i);
//         // 寻找长度为偶数的回文子串(以s[i],s[i + 1])向两边扩散
//         const s2 = palindrome(s, i, i + 1);
//         // 如果这次字符为中心的回文子串长度大于前面得到的，则替换
//         res = res.length > s1.length ? res : s1;
//         res = res.length > s2.length ? res : s2;
//     }
//     return res;
// }

// function palindrome(s, l, r) {
//     let sl = s[l];
//     // 左右指针，从s[l]和s[r]向两边扩散，找到最长回文串
//     while (l >= 0 && r < s.length && s[l] == s[r]) {
//         l--;
//         r++;
//     }
//     // 条件不符合则跳槽循环，这时 l 和 r 的位置是不匹配的，需要回退1
//     //从最左边开始，substr(position,count)
//     return s.substr(l + 1, r - l - 1);
// }
// console.time();
// let s = "fdsafefccc12321cccr";
// console.log(s.substr(7, 11));
// console.log(longestPalindrome(s));
// console.timeEnd();

//=========================================================
/**
 * @param {string} s
 * @return {number}
 */
// var lengthOfLongestSubstring = function (s) {
//     if (typeof s != "string") return false;
//     if (s.length == 1) return 1;

//     let lonelen = 0;
//     for (let i = 0; i < s.length; i++) {
//         const len = getLength(s, i, i + 1);
//         lonelen = lonelen > len ? lonelen : len;
//     }
//     return lonelen;
// };
// function getLength(s, l, r) {
//     if (r == s.length) return 0;
//     let charList = [];
//     while (l >= 0 && !charList.includes(s[l])){
//         charList.push(s[l]);
//         l--;
//     }

//     while (r < s.length && !charList.includes(s[r])) {
//         charList.push(s[r]);
//         r++;
//     }
//     return charList.length;
// }
// console.time();
// let s = "abca";
// console.log(lengthOfLongestSubstring(s));
// console.timeEnd();

//========================
/**
 * @param {string[]} strs
 * @return {string}
 */
// var longestCommonPrefix = function (strs) {
//     if (!(strs instanceof Array) || strs.length == 0) return false;
//     if (strs[0] == "") return "";

//     let strs0len = strs[0].length;
//     for (let i = 0; i < strs0len; i++) {
//         let prefix = strs[0].substr(0, strs0len - i);
//         let allpre = true;
//         for (let j = 1; j < strs.length; j++) {
//             let tag = new RegExp(`^${prefix}`).test(strs[j]);
//             if (!tag) {
//                 allpre = false;
//                 break;
//             }
//         }

//         if (i == strs0len - 1 && allpre == false) return "";
//         if (allpre) return prefix;
//     }
// };
// console.time();
// let strs = ["flower", "flow", "floight"];
// console.log(longestCommonPrefix(strs));
// console.timeEnd();

//===========根单词替换==================
// var replaceWords = function (dictionary, sentence) {
//     if (!(dictionary instanceof Array) || typeof sentence != "string")
//         return false;
//     dictionary.forEach((item) => {
//         let reg = new RegExp(`(\\b${item}[a-zA-Z]+)`,'g');
//         sentence = sentence.replace(reg, item)
//     });

//     return sentence;
// };

// console.time();
// let dictionary = ["a", "aa", "aaa", "aaaa"], sentence = "a aa a aaaa aaa aaa aaa aaaaaa bbb baba ababa";
// console.log(replaceWords(dictionary, sentence));
// console.timeEnd();

//=====================
/**
 * @param {number} n
 * @return {boolean}
 */
// var canWinNim = function (n) {

// };
// console.time();
// console.log(canWinNim(4));
// console.timeEnd();

//====================================
/**
 * @param {number} x
 * @return {number}
 */
//  var reverse = function(x) {

// };

//======
/**
 * @param {number[]} candyType
 * @return {number}
 */
var distributeCandies = function (candyType) {
    if (!(candyType instanceof Array)) return false;
    if (candyType.length == 0 || candyType.length % 2 == 1) return false;

    let count = candyType.length / 2;
    let countType = new Set(candyType).size;
    if (count > countType) {
        return countType;
    } else {
        return count;
    }
};
distributeCandies([1, 2, 3, 3]);

//==================
/**
 * @param {string[]} words
 * @return {string[]}
 */
var findWords = function (words) {
    let charts = "qwertyuiop asdfghjkl zxcvbnm";
    let arr = [];
    for (const item of words) {
        let word = item.toLowerCase();
        if (
            charts.indexOf(word[0]) >= charts.indexOf("q") &&
            charts.indexOf(word[0]) <= charts.indexOf("p")
        ) {
            eachWord(word, charts.split(" ")[0]) ? arr.push(item) : "";
        } else if (
            charts.indexOf(word[0]) >= charts.indexOf("a") &&
            charts.indexOf(word[0]) <= charts.indexOf("l")
        ) {
            eachWord(word, charts.split(" ")[1]) ? arr.push(item) : "";
        } else {
            eachWord(word, charts.split(" ")[2]) ? arr.push(item) : "";
        }
    }
    return arr;
};
var eachWord = function (word, limits) {
    return word.split("").every((item) => limits.includes(item));
};
findWords(["Hello", "Alaska", "Dad", "Peace"]);

//==================
/**
 * @param {number[]} nums
 * @return {number[]}
 */
var singleNumber = function (nums) {
    let gather = new Map();
    let oneArray = [];
    for (const item of nums) {
        //判断Map是否存在数组元素，如果存在则获取旧值并加1，不存在直接设置值为1
        gather.has(item)
            ? gather.set(item, gather.get(item) + 1)
            : gather.set(item, 1);
    }
    gather.forEach((item, key) => {
        //便利Map，如果元素统计值为1，则记录
        item == 1 ? oneArray.push(key) : "";
    });
    return oneArray;
};
singleNumber([1, 2, 1, 3, 2, 5, 1, 1, 2]);
//====================
/**
 * @param {string} board
 * @param {string} hand
 * @return {number}
 */
var findMinStep = function (board, hand) {

};
console.log(findMinStep())
