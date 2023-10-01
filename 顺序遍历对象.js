let s = Symbol("1");
let s2 = Symbol("2");
let obj = {
    0: "2",
    fbc: "abc",
    abc: "abc",
    5.6: "abc",
    5.5: "abc",
    ybc: "abc",
    3: "abc",
    "-8": "3",
    "1e": "1",
    "2020-08-33": "1",
    [s2]: "3.5",
    2: "4",
    "2haha": "5",
    [s]: "6",
    "+5": "3",
};

console.log(Object.getOwnPropertyNames(obj)); //["0","2","1e","+5","2haha"]
console.log(Object.getOwnPropertySymbols(obj)); //[Symbol(2),Symbol(1)]
console.log(Reflect.ownKeys(obj)); //["0","2","1e","+5","2haha",Symbol(2),Symbol(1)]
console.log(Object.keys(obj));

console.log("====== for in =================");
for (let k in obj) {
    // console.log(k,obj[k]);
}

console.log("====== for of =================");
// for…of 可以遍历可迭代对象，即实现了 Symbol.iterator 方法的对象。
//console.log(typeof obj[Symbol.iterator] == "function") // 判断对象是否实现了iterator

obj[Symbol.iterator] = function* () {
    //完成迭代obj的工作
    for (let key in this) {
        let val = this[key];
        yield [key, val];
    }
};

for (const j of obj) {
    // console.log(j);
}

console.log("==========有序遍历==========");
// 字符串真类型数字或number整形数据按顺序大小提前，其他正常排序
