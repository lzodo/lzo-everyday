// ==========Promise 比回调函数更优雅的异步编程解决方案========
// promise 有 3 种状态：pending(默认)、fulfilled 或 rejected。状态改变只能是 pending->fulfilled 或者 pending->rejected
new Promise(
    function (resolve, reject) {
        // 一段耗时的异步操作(只会走一个resolve或reject)
        // 这里是同步的，resolve或reject里才是一般的
        //resolve('成功') // 数据处理完成
        reject('失败') // 数据处理出错

    }
).then(
    (res) => { console.log(res + 'res') },  // 成功
    (err) => { console.log(err + 'err1') } // 第一个then有第二个失败函数,走这里,如何没有就会走catch
).catch(
    (err) => { console.log(err + 'err2') } // 失败
)

// async/await同时存在 async:function/await必须在这个function内使用
// async声明的函数的返回本质上是返回一个Promise。
console.log(async function asyncfunc() { //必须是这个格式函数
    
}())

const demo = async ()=>{
    let result = await setTimeout(()=>{
      console.log('我延迟了一秒');
    }, 1000)
    console.log('我由于上面的程序还没执行完，先不执行“等待一会”');
    return result
}
demo().then(result=>{
  console.log('输出',result);
})


