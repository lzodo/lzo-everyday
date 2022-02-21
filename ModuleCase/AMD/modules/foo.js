define([
    "bar", // 指定需要依赖的模块
], function (bar) {
    "use strict";
    console.log(bar.name);
    console.log(bar.age);
});
