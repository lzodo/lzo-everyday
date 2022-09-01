function count(n) {
    let counts = 0;
    for (let i = 1; i <= n; i++) {
        (i + "").split("").forEach((item) => {
            if (item == 1) {
                counts++
            }
        })
    }
    return counts;
}
console.log(count(13));

// ========================
var ac = 10;

if (true) {
    // a = 50
    let ac = 0;
}

let arr = [1, 2, 3, 4]
let [a, b, c = 100, d, e = 150] = arr;
console.log(c);
console.log(e);
c = 10;
console.log(c)
console.log(arr)

let user = {
    name: "123",
    age: 100
}
let { name, age: age2 } = user;
console.log(name);
console.log(age2);
name = 456;
console.log(name)
console.log(user)

let str = "123abc456";
console.log(str.includes("abc")); // true
console.log(str.startsWith("123")); // true
console.log(str.endsWith("456")); // true


function fn({ name, age }, a, b = 10, ...c) {
    console.log(name, age)
    console.log(a)
    console.log(b)
    console.log(c)
}

fn(user, 1, 2, 3, 4)

console.log(...[1, 2, 3, 4])
console.log({ ...obj })
