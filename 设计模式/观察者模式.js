/**
 * 观察者模式中，只有两种主体：目标对象[发布消息的官方] (Subject) 和 观察者[订阅消息的用户] (Observer)
 *      目标对象(Subject)
 *          需要定义添加观察者的方法(addobserver) === 给用户点击的订阅按钮
 *          需要维护观察者列表(observerList) === 订阅了消息的用户列表
 *          任务发生变化通过 notify 方法依次通知每个观察者(订阅用户)，让他们 执行 update 方法获取最新数据
 *      观察者 Observer 需要实现 update，update方法中可以执行自定义的业务逻辑
 */

class Observer {
    constructor(name) {
        this.name = name;
    }
    update({ taskType, taskInfo }) {
        // 假设任务分为日常route和战斗war
        if (taskType === "route") {
            console.log(`${this.name}不需要日常任务`);
            return;
        }
        this.goToTaskHome(taskInfo);

    }
    goToTaskHome(info) {
        console.log(`${this.name}去任务大殿抢${info}任务`);
    }
}

class Subject {
    constructor() {
        this.observerList = []
    }
    addObserver(observer) {
        this.observerList.push(observer);
    }
    notify(task) {
        console.log("发布五星任务");
        this.observerList.forEach(observer => observer.update(task))
    }
}

const subject = new Subject();
const stu1 = new Observer("弟子1");
const stu2 = new Observer("弟子2");

// stu1 stu2 购买五星任务通知权限
subject.addObserver(stu1);
subject.addObserver(stu2);

setTimeout(() => {
    // 任务殿发布五星战斗任务
    const warTask = {
        taskType: 'war',
        taskInfo: "猎杀时刻"
    }

    // 任务大殿通知购买权限弟子
    subject.notify(warTask);
}, 3000)

setTimeout(() => {
    // 任务殿发布五星日常任务
    const routeTask = {
        taskType: 'route',
        taskInfo: "种树浇水"
    }

    subject.notify(routeTask);
}, 6000)
