const render = (template, data) => {
    // \s*?是为了兼容{{name}} {{ name }}这种写法
    return template.replace(/{{\s*?(\w+)\s*?}}/g, (match, key) => {
        // 匹配中了则读取替换，否则替换为空字符串
        console.log(match, key);
        return key && data.hasOwnProperty(key) ? data[key] : "";
    });
};
const data = {
    name: "前端胖头鱼",
    age: 100,
};
const template = `
    我是: {{ name }}
    年龄是: {{age}}
  `;
// console.log(render(template, data));

// let str = "123abc 45 6 cdf789"
// str.replace(/(\d+)(a)?/g,(a,b,c)=>{
//     console.log(a,b,c)
// })
/*
  我是: 前端胖头鱼
  年龄是: 100
  */
// 类数组转数组
function getArray() {
    console.log(arguments);
    //1. 原理是数组的slice()方法可以从已有数组中返回一个新数组，它可以接受两个参数arr.slice(start,end),如果不传参将返回原数组的一个副本，但该方法不会修改原数组，而是返回截取的新数组
    console.log(Array.prototype.slice.call(arguments));
    //2. splice(start,count,item) 改变原数组
    console.log(Array.prototype.splice.call(arguments, 0));
    //3. Array.from(arguments)
    console.log(Array.from(arguments));
    //4. Array.apply(null, arguments)
    console.log(Array.apply(null, arguments));
    //5. [].concat.apply([], arguments)
    console.log([].concat.apply([], arguments));
    //6. 循环遍历类数组对象，push到新创建的数组对象里
}

//getArray(1, 2, 3);

// 数组扁平化
let arr = [1, 2, [3, 4], 5, [8, [9, 10]]];
// 1. arr.flat默认两层 -> Infinity不限制层数
console.log(arr.flat(Infinity));
// 2. toString
console.log(
    arr
        .toString()
        .split(",")
        .map((item) => Number(item))
);
// 3. reduce
const flatten = (array) =>
    array.reduce((acc, cur) => {
        // console.log(acc, cur);
        return Array.isArray(cur) ? [...acc, ...flatten(cur)] : [...acc, cur];
    }, []);
console.log(flatten(arr));
// 4. xxxx
