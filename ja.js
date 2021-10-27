

var twoSum = function (nums, target) {
    let ind = [];
    nums.map((it1, in1) => {
        nums.map((it2, in2) => {
            if (in1 != in2 && it1 + it2 == target) {
                ind = [in1, in2]
            }
        })
    })
    return ind.sort((a, b) => a - b);
};
console.log(twoSum([2, 7, 11, 15], 22));

//================================================

let travelPlans = {
    destination: 'DC',
    monday: {
      location: 'National Mall',
      budget: 200,
      host: null
    }
  }
  let res = travelPlans?.tuesday?.location ?? "locahost"; // => locahost
  let res2 = travelPlans?.host; // => undefined


let config = {
    db:{
        host:"ccc"
    }
}
// const host = config && config.db && config.db.host;
// ?.可选链操作符
// 查找config下的db下的host属性，如果那一层没有，直接返回undefined
const host = config?.db?.host;

// (?=(p)) 匹配找到 符合p子模式 前面的 那个位置
console.log('18060849356'.replace(/(?=(\d{4})+$)/g,'-'));
console.log('18060849356'.replace(/(?!^)(?=(\d{3})+$)/g,'-'));

// const str = "1021-10-24gg";
// const r1 = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
// const exec = r1.exec(str);
// console.log(exec)

let str = "e=pow;d=555;22r5";
let reg =/(?=(.*d=\d{3,};.*))(\w+=\w+;){2,}(\w{4})?$/


console.log(reg.test(str))

