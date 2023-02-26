// 找到 121  1221

console.time()
new Array(10000).fill("").forEach((item, i) => {
    // 1、正则
    let str = i.toString();
    let reg = "";
    if (str.length == 2) {
        reg = /(\d)\1/
    } else if (str.length == 3) {
        reg = /(\d)\d\1/
    } else if (str.length == 4) {
        reg = /(\d)(\d)\2\1/
    }

    if (reg && reg.test(str)) {
        console.log(i)
    }

    // 2 数字 === 数字字符串,反转
    if(i.toString().length > 1 && i === Number(i.toString().split('').reverse().join(''))){
        console.log(i)
    }
})
console.timeEnd();


