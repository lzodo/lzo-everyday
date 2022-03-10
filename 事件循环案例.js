// setTimeout(function () {
//     console.log("定时器开始啦");
// });

// new Promise(function (resolve) {
//     console.log("马上执行for循环啦");
//     for (var i = 0; i < 10000; i++) {
//         i == 99 && resolve();
//     }
// }).then(function () {
//     console.log("执行then函数啦");
// });

// function aaa(data) {
//     console.log(data);
// }
// console.log("代码执行结束");
//========================================
// for (var i = 1; i <= 5; i++) {
//     setTimeout(function timer() {
//         console.log(t);
//     }, t * 1000);
// }
//=======================
console.log('1');
// 1\7\6\8\2\4\3\5\9\11\10\12
setTimeout(function() {
    console.log('2');
    process.nextTick(function() {
        console.log('3');
    })
    new Promise(function(resolve) {
        console.log('4');
        resolve();
    }).then(function() {
        console.log('5')
    })
})
process.nextTick(function() {
    console.log('6');
})
new Promise(function(resolve) {
    console.log('7');
    resolve();
}).then(function() {
    console.log('8')
})

setTimeout(function() {
    console.log('9');
    process.nextTick(function() {
        console.log('10');
    })
    new Promise(function(resolve) {
        console.log('11');
        resolve();
    }).then(function() {
        console.log('12')
    })
})
