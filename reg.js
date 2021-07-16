let str = "e=pow;d=555;22r5";
let reg =/(?=(.*d=\d{3,};.*))(\w+=\w+;){2,}(\w{4})?$/


console.log(reg.test(str))

// 待测试 测试中 待审核 测试结束