/**
 * 发布订阅模式中有三个角色，发布者 Publisher ，事件调度中心 Event Channel ，订阅者 Subscriber
 *      与观察者模式相比，多了一个中介
 *
 * 发布者 Publisher
 * 事件调度中心 Event Channel
 *      需要维护任务类型，以及每种任务订阅者的列表
 *      需要定义添加订阅者的方法 === 给用户点击的订阅按钮
 *      得到发不者的新任务，需要给每个订阅者发布任务
 * 订阅、接任务者 Subscriber
 *
 */

class EventEmitter {
    constructor() {
        /**
         *  构造一个这样的对象
         *      {
         *          click:[fn1,fn2],
         *          xxxxx:[fn4,fn4],
         *      }
         */
        this.events = {};
    }
    // 订阅方法
    on(event, fn) {
        if (!this.events[event]) {
            this.events[event] = []
        }
        this.events[event].push(fn);
    }

    // 一次性订阅，收到一次发布就取消
    once(event, fn) {
        // once 的事件 触发的函数，包装一下再拿去订阅
        const warpper = (...args) => {
            fn(...args);
            this.off(event, warpper)
        }
        this.on(event, warpper)
    }

    // 发布新任务
    emit(event, ...args) {
        if (this.events[event]) {
            this.events[event].forEach(fn => {
                fn(...args)
            });
        }
    }

    // 取消订阅
    off(event, fn) {
        if (this.events[event]) {
            let fnIndex = this.events[event].findIndex(item => item === fn);
            if (fnIndex != -1) {
                this.events[event].splice(fnIndex, 1);
            }
        }
    }

    // 取消全部
    offAll(event) {
        if (this.events[event]) {
            delete this.events[event]
        }
    }
}

var emitter = new EventEmitter();

// 一个人订阅一个 ev1 任务或事件
emitter.on("ev1", (arg1, arg2) => {
    console.log(`ev1 事件被触发 或 有人发布ev1任务 ：${arg1} -- ${arg2}`)
})

function ev2callback(arg1, arg2) {
    console.log(`ev2 事件被触发 或 有人发布ev2任务 ：${arg1} -- ${arg2}`)
}
function ev2callback2() {
    console.log(`ev2 被第二次订阅`)
}
emitter.on("ev2", ev2callback)
emitter.on("ev2", ev2callback2)

// 一个人订阅一次性任务
emitter.once("ones-event", (arg1, arg2) => {
    console.log(`ones-event 这个任务只能 emit 一次 ：${arg1} -- ${arg2}`)
})

// 发布者 通过 EventEmitter 发布一个任务
emitter.emit("ev1", "参数1");
emitter.emit("ev1", "发布第二次", '参数2');
emitter.emit("ev2", "ev2", 'ev2');
// emitter.offAll("ev1");
// emitter.off("ev2",ev2callback);
emitter.emit("ev1", "发布第二次", '参数2');
emitter.emit("ev2", "ev2", 'ev2');

emitter.emit("ones-event", "once11", 'once12');
emitter.emit("ones-event", "once21", 'once22');
































// class PubSub {
//     constructor() {
//         // 事件中心
//         // 存储格式: warTask: [], routeTask: []
//         // 每种事件(任务)下存放其订阅者的回调函数
//         this.events = {}
//     }
//     // 订阅方法
//     subscribe(type, cb) {
//         if (!this.events[type]) {
//             this.events[type] = [];
//         }
//         this.events[type].push(cb);
//     }
//     // 发布方法
//     publish(type, ...args) {
//         if (this.events[type]) {
//             this.events[type].forEach(cb => cb(...args))
//         }
//     }
//     // 取消订阅方法
//     unsubscribe(type, cb) {
//         if (this.events[type]) {
//             const cbIndex = this.events[type].findIndex(e => e === cb)
//             if (cbIndex != -1) {
//                 this.events[type].splice(cbIndex, 1);
//             }
//         }
//         if (this.events[type].length === 0) {
//             delete this.events[type];
//         }
//     }
//     unsubscribeAll(type) {
//         if (this.events[type]) {
//             delete this.events[type];
//         }
//     }
// }

// // 创建一个中介公司
// let pubsub = new PubSub();

// // 弟子一订阅战斗任务
// pubsub.subscribe('warTask', function (taskInfo) {
//     console.log("宗门殿发布战斗任务，任务信息:" + taskInfo);
// })
// // 弟子一订阅战斗任务
// pubsub.subscribe('routeTask', function (taskInfo) {
//     console.log("宗门殿发布日常任务，任务信息:" + taskInfo);
// });
// // 弟子三订阅全类型任务
// pubsub.subscribe('allTask', function (taskInfo) {
//     console.log("宗门殿发布五星任务，任务信息:" + taskInfo);
// });

// // 发布战斗任务
// pubsub.publish('warTask', "猎杀时刻");
// pubsub.publish('allTask', "猎杀时刻");

// // 发布日常任务
// pubsub.publish('routeTask', "种树浇水");
// pubsub.publish('allTask', "种树浇水");
