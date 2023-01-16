class EventEmitter {
    constructor() {
        this.cache = {};
    }

    // 定义事件
    on(name, fn) {
        if (this.cache[name]) {
            this.cache[name].push(fn);
        } else {
            this.cache[name] = [fn];
        }
    }

    off(name, fn) {
        // 关闭某个时间下，指定fn,一次，
        const tasks = this.cache[name];
        if (tasks) {
            // 如果该事件存在两个相同的函数，也只删除第一个
            // const index = tasks.findIndex((f) => f === fn || f.callback === fn);
            // if (index >= 0) {
            //     tasks.splice(index, 1);
            // }

            // 删除单个不方便，通过过滤得到新数组
            this.cache[name] = tasks.filter((f)=> f != fn);
        }
    }

    emit(name, once = false) {
        if (this.cache[name]) {
            // 创建副本，如果回调函数内继续注册相同事件，会造成死循环
            const tasks = this.cache[name].slice();
            for (let fn of tasks) {
                fn();
            }
            if (once) {
                delete this.cache[name];
            }
        }
    }
}

// 测试
const eventBus = new EventEmitter();
const task1 = () => {
    console.log("task1");
};
const task2 = () => {
    console.log("task2");
};

eventBus.on("task", task1);
eventBus.on("task", task1);
eventBus.on("task", task2);
eventBus.off("task", task1);
setTimeout(() => {
    eventBus.emit("task"); // task2
}, 1000);
