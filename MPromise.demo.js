const MPromise = require("./MPromise");

new MPromise((resolve, reject) => {
    console.log(1);
    console.log(2);
    resolve(3);
}).then((res) => {
    console.log(res);
});
