/**
 * @param {string} s
 * @param {string[]} words
 * @return {number[]}
 */
let findSubstring = (s, words)=> {
    let wordLength = words[0].length;
    let wordsCount = words.length;
    let result = [];
    words.forEach((word) => {
        s.split("").forEach((item, index) => {
            if (word[0] == item) {
                let beforeWord, visWords, reg, filterWords;
                beforeWord = s.substr(index, wordLength);
                if (words.includes(beforeWord)) {
                    // 拿到除了第一个单词外的单词
                    filterWords = words.filter((item) => item != beforeWord);

                    // 如果第一个单词重复，则补上重复的个数(如果条件中words不会重复则可以沈略)
                    let repeatCount = words.length - filterWords.length - 1;
                    if (repeatCount > 0) {
                        for (let i = 0; i < repeatCount; i++) {
                            filterWords.push(beforeWord);
                        }
                    }

                    // 获取预期要得到的字符串
                    visWords = s.substr(index, wordLength * wordsCount);

                    // 只能验证首单词后面是否跟随words长度减1个words里的其他单词
                    reg = new RegExp(
                        `${beforeWord}(?=[${filterWords.join("|")}]){${
                            wordsCount - 1
                        }}`
                    );

                    reg = new RegExp(
                        `${beforeWord}(?=[${filterWords.join("|")}]){${
                            wordsCount - 1
                        }}`
                    );

                    // console.log(reg);
                    // console.log(beforeWord);
                    // console.log(visWords);
                    // console.log(reg.test(visWords));
                    if (reg.test(visWords)) {
                        // 如果正向肯定预查中某个原生重复多次
                        if(visRepeat(words,visWords)){
                            result.push(index);
                        }
                    }
                }
            }
        });
    });
    return result.sort((a, b) => a - b);
};

let visRepeat = (arr,str)=>{
    // arr.forEach()
}

let s = "barfoothethefoobarman",
    words = ["foo", "bar"];
console.log(findSubstring(s, words));
