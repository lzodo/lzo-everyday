// ==============原始类型值Symbol 生成相等的变量名
// 不会被for...in、for...of和Object.keys()、Object.getOwnPropertyNames() 遍历出来

let s1 = Symbol();
let s2 = Symbol();
console.log(s2 === s1);

// 第一种写法（设置时不能用点）
var Sym = {};
Sym[s1] = "Hello!";

// 第二种写法
Sym = {
    [s1]: "Hello!",
    name: "name",
    age: "1000",
};

// 第三种写法
Object.defineProperty(Sym, s1, { value: "Hello!" });
console.log(Object.getOwnPropertyDescriptor(Sym, s1));

// 遍历
console.log("===========================");

// for(let i in Sym){
//     console.log(i);
// }
// console.log(Object.getOwnPropertySymbols(Sym))
console.log(Reflect.ownKeys(Sym));

console.log("===========================");

// for 与 keyFor
var t1 = Symbol.for("foo");
var t2 = Symbol.for("foo");
console.log(t1 === t2); // true

var b1 = Symbol.for("foo");
console.log(Symbol.keyFor(b1)); // "foo"

var b2 = Symbol("foo");
console.log(Symbol.keyFor(b2)); // undefined
