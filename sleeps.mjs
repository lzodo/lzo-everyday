// 将 node 模块 变成async环境 ，.mjs 或 package.json 的 "type": "module"

async function sleep(time) {
    await new Promise((resolve, reject) => setTimeout(resolve, time))
}

// .mjs 才行
console.log('开始')
await sleep(2000)
console.log('结束')
// async function xxx() {
//     console.log('开始')
//     await sleep(2000)
//     console.log('结束')
// }

// xxx()


// 不适用定时器实现
// function sleep(time) {
//     var now = Date.now()
//     while (Date.now() - now <= time);
// }
// console.time(1)
// sleep(2000)
// console.log(123)
// console.timeEnd(1)

// console.time(1)
// sleep(3000)
// console.log(456)
// console.timeEnd(1)
