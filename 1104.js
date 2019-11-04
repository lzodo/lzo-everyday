let nums = [1, 2, 3,4,5,6];
console.log(nums.map((item, index) => {
  console.log(item);
  item = item + 100;
  return item;
}))
console.log(nums);