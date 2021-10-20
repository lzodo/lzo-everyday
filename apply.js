Function.prototype.bind2 = function (context, ...args) {
    if (typeof this !== "function") {
        throw new TypeError("Bind must be called on a function");
    }

    console.log(context)
    console.log(args)

    const executeBound = function (
        sourceFunc, //bound外默认作用域this对象
        boundFunc,
        context, //用户指定作用域context
        callingContext,//bound内作用域
        args,//参数列表
    ) {
        if (!(callingContext instanceof boundFunc)) {
            // 如果调用方式不是new func的形式就直接调用sourceFunc，并且给到对应的参数即可
            return sourceFunc.apply(context, args);
        } else {
            // 类似于执行new的几个过程
            const self = Object.create(sourceFunc.prototype); // 处理new调用的形式
            const result = sourceFunc.apply(self, args);
            // 判断函数执行后的返回结果 非对象函数，则返回self
            if (
                (result && typeof result === "object") ||
                typeof result === "function"
            ) {
                return result;
            } else {
                return self;
            }
        }
    };
    const func = this;

    const bound = function (...innerArgs) {
        return executeBound(func, bound, context, this, args.concat(innerArgs));
    };

    return bound;
};

// 测试
// 1. 普通调用
const showName = function (sex, age) {
    console.log(this, sex, age);
};

showName.bind2({ name: "前端胖头鱼" }, "boy")(100); // { name: '前端胖头鱼' } 'boy' 100

// // 2. new 调用
// const Person = function (name) {
//     this.name = name;
// };

// Person.prototype.showName = function (age) {
//     console.log(this, this.name, age);
// };

// const bindPerson = Person.bind(null, "boy");
// const p1 = new bindPerson("前端胖头鱼");

// p1.showName(100); // Person { name: 'boy' } 'boy' 100
