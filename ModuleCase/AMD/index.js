(function () {
    require.config({
        //配置 定义模块
        baseUrl: "",
        paths: {
            // 定义模块,不需要后缀名
            bar: "./modules/bar",
            foo: "./modules/foo",
        },
    });

    require(["foo"], function (foo) {}); //加载foo模块
})();
