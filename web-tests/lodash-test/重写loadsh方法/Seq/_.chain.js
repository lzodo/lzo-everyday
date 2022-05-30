/**
 * lodash 方法
 *
 *
 */

const { sortBy } = require("lodash");
let _ = require("lodash");
var users = [
    { user: "barney", age: 36 },
    { user: "fred", age: 40 },
    { user: "pebbles", age: 1 },
];

var youngest = _.chain(users)
    .sortBy("age")
    .map(function (o) {
        return o.user + " is " + o.age;
    })
    .head()
    .value();
// console.log(youngest);

/**
 * 实现
 *
 */

// let m_xxx = () => {};
// console.log(m_xxx());

// let sortBy1 = (obj,str) => {
//     return obj.sort((a,b)=> a[str] - b[str])
// }
// console.log(sortBy1(users,'age'))

// function Lnhand(age) {
//     console.log(age, 111111111111111);
//     this.ln1 = () => {
//         console.log("ln1");
//     };
//     this.ln2 = () => {
//         console.log("ln2");
//     };
// }
// // Lnhand.prototype.ln1 = function(){
// //     console.log("111");
// // }

// // Lnhand.prototype.ln2 = function(){
// //     console.log("222");
// // }
// Lnhand(11).ln1();


// jQuery = function( selector, context ,rootjQuery) {
//     return new jQuery.fn.init( selector, context, rootjQuery );
// },
// jQuery.fn = jQuery.prototype = { //fn即对应prototype
//     constructor: jQuery,
//     init: function( selector, context, rootjQuery ) {
//         console.log(selector, context, rootjQuery)
//         return this;
//     },
//     a:function(d){
//         console.log(d)
//     },
// }
// jQuery.fn.init.prototype = jQuery.fn;

// jQuery(1,2,3).a(4)


function jQuery( selector, context) {
    return new jQuery.fn.init( selector, context);
}
jQuery.fn = jQuery.prototype = { //fn即对应prototype
    constructor: jQuery,
    init: function( selector, context ) {
        console.log(selector, context)
        return this;
    },
    then:function(par){
        console.log(par);
        return this;
    },
}
jQuery.fn.init.prototype = jQuery.fn;

jQuery(1,2).then(4).then(5);
