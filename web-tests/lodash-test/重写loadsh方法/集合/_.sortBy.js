/**
 * lodash 方法
 * 按集合某个属性排序
 *
 */

let _ = require("lodash");
var users = [
    { user: "fred", age: 48 },
    { user: "barney", age: 36 },
    { user: "fred", age: 40 },
    { user: "barney", age: 34 },
    { user: "11", age: 46 },
];
// let a = _.sortBy(users, function (o) {
//     console.log(o.user);
//     return o.user;
// });
// console.log(a,344)

/**
 * 实现
 *
 */
let m_sortBy = (obj,prop) => {
    obj.forEach(element => {
        prop(element)
    });

    // typeof prop == 'function'
    // return obj.sort((a,b)=> a[str] - b[str])
}
console.log(m_sortBy(users,function(o){
    console.log(o,3)
    return o.age
}))
