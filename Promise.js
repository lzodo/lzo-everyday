/*
    异步代码处理方式
    1、回调函数
    2、以Promise为主的链式回调
    3、使用Generators
    4、async/await(Generators 优化封装好的语法糖)
*/

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

/**
 * Generator 方式
 */
function* fetchUserByGenerator() {
    const user = yield new Promise((resolve, reject) => {
       setTimeout(()=>{
           resolve('2000毫秒后');
        },2000)
    });
    const user2 = yield new Promise((resolve, reject) => {
        setTimeout(()=>{
            resolve('user2 3000毫秒后');
         },3000)
     });
    // return user;
}

const g = fetchUserByGenerator();
const result = g.next().value;
const result2 = g.next().value;
// g.next(); 如果有 { value: Promise, done: false }
// g.next(); 没有了返回 { value: undefined, done: true }
result.then((v) => {
    console.log(v);
}, (error) => {
    console.log(error);
})
result2.then((v) => {
    console.log(v);
}, (error) => {
    console.log(error);
})



// async/await同时存在 async:function/await必须在这个function内使用
// async声明的函数的返回本质上是返回一个Promise。
// async 后必须跟function  //必须是这个格式函数
    


const demo = async ()=>{
    let result = await setTimeout(()=>{
      console.log('我延迟了一秒');
    }, 1000)
    console.log('我由于上面的程序还没执行完，先不执行“等待一会”');
    return result
}
// demo().then(result=>{
//   console.log('输出',result);
// })

//直接用Promise 与 async/await

function takeLongTime(n) {
    return new Promise(resolve => {
        setTimeout(() => resolve(n + 200), n);
    });
}

function step1(n) {
    console.log(`step1 with ${n}`);
    return takeLongTime(n);
}

function step2(n) {
    console.log(`step2 with ${n}`);
    return takeLongTime(n);
}

function step3(n) {
    console.log(`step3 with ${n}`);
    return takeLongTime(n);
}


function doIt() {
    console.time("doIt");
    const time1 = 300;
    step1(time1)
        .then(time2 => step2(time2))
        .then(time3 => step3(time3))
        .then(result => {
            console.log(`result is ${result}`);
        });
}
//doIt();


async function doIt2() {
    console.time("doIt");
    const time1 = 300;
    const time2 = await step1(time1); //在这里step1没执行完成是不好走下一步的
    const time3 = await step2(time2);
    const result = await step3(time3);
    await new Promise(resolve => {
        setTimeout(()=>{
            console.log('先执行');
            resolve()
        },5000)
    })
    console.log('后执行')
    console.log(`result is ${result}`);
}
//doIt2();

