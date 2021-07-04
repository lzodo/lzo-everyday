// ==================模块化模式==============

var myModule = {
    myProperty: "someValue",
    // 对象字面值包含了属性和方法（properties and methods）.
    // 例如，我们可以定义一个模块配置进对象：
    myConfig: {
        useCaching: true,
        language: "en"
    },
    // 非常基本的方法
    myMethod: function () {
        console.log("Where in the world is Paul Irish today?");
    },
    // 输出基于当前配置（<span>configuration</span>）的一个值
    myMethod2: function () {
        console.log("Caching is:" + (this.myConfig.useCaching) ? "enabled" : "disabled");
    },
    // 重写当前的配置（configuration）
    myMethod3: function (newConfig) {
        if (typeof newConfig === "object") {
            this.myConfig = newConfig;
            console.log(this.myConfig.language);
        }
    }
};
// 输出: Where in the world is Paul Irish today?
myModule.myMethod();

// 输出: enabled
myModule.myMethod2();

// 输出: fr
myModule.myMethod3({
    language: "fr",
    useCaching: false
});

//==================================================

var testModule = (function () {
    var counter = 0;
    return {
        incrementCounter: function () {
            return counter++;
        },
        resetCounter: function () {
            console.log("counter value prior to reset: " + counter);
            counter = 0;
        }
    };
})();
testModule.incrementCounter(); 
testModule.resetCounter();

//=====================================================

console.log(window)
;(function(window,undefined){
	var OrgTpl = {
		pmRui : function(){
			console.log('pmRui');
		},
		pmPartner : function(){
			throw new Error('pmPartner');
		},
		init : function(){
            console.log(this)
			this.pmRui();
			this.pmPartner();
		}	
	};
	window.OrgTpl = OrgTpl;
})(window);


var PartnerOne = function(){
	OrgTpl.pmPartner=function(){
		console.log('**你好')
	}
	OrgTpl.init();
 
};
PartnerOne();