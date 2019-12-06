//运行时间
const startTime = performance.now();
let sum = 0;
for(let i = 0;i < 100000;i++) {
    sum += i;
}
const diffTime = performance.now() - startTime;
console.log(`Execution time: ${ diffTime }`);
// =================

console.time('sum');
let sum = 0;
for(let i = 0;i < 100000;i++) {
    sum += i;
}
console.timeEnd('sum');