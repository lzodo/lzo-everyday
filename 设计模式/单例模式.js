// ===============单例模式==============
// 限制一个类只能有一个实例化对象 ||只允许被实例化一次的类
var mySingleton = (function () {
    var instance;
    function init() {
        // 单例
        // 私有方法和变量
        function privateMethod() {
            console.log("I am private");
        }
        var privateVariable = "Im also private";
        var privateRandomNumber = Math.random();
        return {
            // 共有方法和变量
            publicMethod: function () {
                console.log("The public can see me!");
            },
            publicProperty: "I am also public",
            getRandomNumber: function () {
                return privateRandomNumber;
            }
        };
    };
    return {
        // 如果存在获取此单例实例，如果不存在创建一个单例实例
        getInstance: function () {
            if (!instance) {
                instance = init();
            }
            return instance;
        }
    };
})();


var myBadSingleton = (function () {
    // 存储单例实例的引用
    var instance;
    function init() {
        // 单例
        var privateRandomNumber = Math.random();
        return {
            getRandomNumber: function () {
                return privateRandomNumber;
            }
        };
    };
    return {

        // 总是创建一个新的实例
        getInstance: function () {
            instance = init();
            return instance;
        }
    };
})();

// 使用:

var singleA = mySingleton.getInstance();
var singleB = mySingleton.getInstance();
console.log(singleA.getRandomNumber() === singleB.getRandomNumber()); // true

var badSingleA = myBadSingleton.getInstance();
var badSingleB = myBadSingleton.getInstance();
console.log(badSingleA.getRandomNumber() === badSingleB.getRandomNumber()); // false


//====================

let singleCase = function(name){
    this.name = name;
};
singleCase.prototype.getName = function(){
    return this.name;
}
// 获取实例对象
let getInstance = (function() {
    var instance = null;
    return function(name) {
        if(!instance) {//相当于一个一次性阀门,只能实例化一次
            instance = new singleCase(name);
        }
        return instance;
    }
})();
// 测试单体模式的实例,所以one===two
let one = getInstance("one"); 
console.log(one.getName())
let two = getInstance("two");  
console.log(two.getName())
console.log(two === one)
