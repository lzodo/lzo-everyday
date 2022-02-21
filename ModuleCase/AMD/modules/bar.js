define(function () {
    // 定义模块
    const name = "barname";
    const age = "18";

    const eat = function(data) {
        console.log(data);
    }
    return {
        name: name,
        age: age,
        eat: eat,
    };
});
