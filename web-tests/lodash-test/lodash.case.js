var _ = require('lodash')
// console.log(_)
//console.log(_.join(['a', 'b', 'c'], '~'));

var object = { 'a': [{ 'b': { 'c': 3  }  }, 4]  };
console.log(_.at(object, ['a[0].b.c', 'a[1]']))

var users = {
    'barney':  { 'age': 36, 'active': true  },
    'fred':    { 'age': 40, 'active': false  },
    'pebbles': { 'age': 1,  'active': true  }

};

console.log(_.findKey(users, function(o) { return true }))


let x = {
    name:"Aiden",
    sex:"male",
    age:100,
    2:"2",
    1:1,
    "0":123,
    0.1:333,
    i: 0,
    a:1,
};

Object.keys(x).forEach((temp)=>{
    console.log(temp + ':' + x[temp])
})
//=======================
let jsons={a:"aaa1",b:"bbb2",c:"ccc3",3:3,d:"ddd4"};
let arr=[];
console.log(Object.keys(jsons))
Object.keys(jsons).forEach((key,index)=>{arr.push(jsons[key]);});
console.log(arr)    // (4) [“aaa1”, “bbb2”, “ccc3”, “ddd4”]
//=================================
console.log((()=>'1234opkl')())
let maps = new Map(Object.entries(x))
console.log(maps)
//==================
console.log(_.keys(x))

