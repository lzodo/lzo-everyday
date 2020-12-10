//模拟localStore功能
const localStorageMock = (function () {
    let store = {};
    return {
        getItem: function (key) {
            return store[key] || null;
        },
        setItem: function (key, value, time) {
            // time 是毫秒级别,过时时间必须大于0ms
            time = Number(time) ? time : 0;
            store[key] = value.toString();
            if (time > 0) {
                this.timeOut(key, time);
            }
        },
        timeOut: function (key, time) {
            let that = this;
            let timer = setTimeout(function () {
                that.removeItem(key);
                clearTimeout(timer);
            }, time);
        },
        removeItem: function (key) {
            delete store[key];
        },
        clear: function () {
            store = {};
        },
    };
})();

Object.defineProperty(window, "localStorage2", {
    //定义新属性或修改原有的属性。
    value: localStorageMock,
});

localStorage2.setItem("test", "test", 3000);
console.log(localStorage2.getItem("test")); //test

setTimeout(function () {
    console.log(localStorage2.getItem("test")); //null
}, 4000);

function a(x) {
    let arr = Array(x);
    let resultArr = [...arr, ...arr, ...arr, ...arr, ...arr, ...arr, ...arr];
    return resultArr.length;
}

const urls = [
    "https://www.xx.cn/api?keyword=&level1=&local_batch_id=&elective=&local_province_id=33",
    "https://www.xx.cn/api?keyword=&level1=&local_batch_id=&elective=800&local_province_id=33",
    "https://www.xx.cn/api?keyword=&level1=&local_batch_id=&elective=800,700&local_province_id=33",
];

function getElective(url) {
    const reg = new RegExp("(^|&)elective=([^&]*)(&|$)", "i");
    console.log(reg);
    const r = url.match(reg);
    console.log(r);
    console.log(url.substr(0));

    if (r != null) {
        return r[2] ? r[2].split(",") : [];
    }

    return [];
}

urls.forEach((url) => {
    const result = getElective(url);
    console.log(result, "---result");
});

function getUrlValue(url) {
    if (!url) return;
    let res = url.match(/(?<=elective=)(\d+(,\d+)*)/);
    console.log(res);
    return res ? res[0].split(",") : [];
}
console.log(
    getUrlValue(
        "https://www.xx.cn/api?keyword=&level1=&local_batch_id=&elective=800,700&local_province_id=33"
    )
);

var name = "Tom";
(function () {
    console.log(typeof name);
    console.log(name);
    if (typeof name == "undefined") {
        let name = "Jack";
        console.log("Goodbye " + name);
    } else {
        console.log("Hello " + name);
    }
})();

var name = "Tom";
(function () {
    console.log(name);
})();

Function.prototype.mybind = function (context) {
    if (typeof this !== "function") {
        throw new TypeError("Error");
    }
    let _this = this;
    let arg = [...arguments].slice(1);
    return function F() {
        // 处理函数使用new的情况
        if (this instanceof F) {
            return new _this(...arg, ...arguments);
        } else {
            return _this.apply(context, arg.concat(...arguments));
        }
    };
};

const nums1 = [1, 10, 2, 3, 4, 5, 7, 8, 10];
function simplifyStr(num) {
    var result = [];
    var temp = num[0];
    num.forEach((value, index) => {
        if (value + 1 !== num[index + 1]) {
            if (temp !== value) {
                result.push(`${temp}~${value}`);
            } else {
                result.push(`${value}`);
            }
            temp = num[index + 1];
        }
    });
    return result;
}
console.log(simplifyStr(nums1).join(","));

var arr = [1, 5, 2, 5, 6, 21, 5, 72, [3, 4]];

Array.from(new Set(arr.flat().sort((a, b) => a - b)));
new Set(arr.flat().sort((a, b) => a - b));
arr.flat().sort((a, b) => a - b);
arr.sort((a, b) => a - b);
console.log();

var entry = {
    a: {
        b: {
            c: {
                dd: "abcdd",
            },
        },
        d: {
            xx: "adxx",
        },
        e: "ae",
    },
};

function flatObj(obj, parentKey = "", result = {}) {
    for (const key in obj) {
        console.log(key);
        if (obj.hasOwnProperty(key)) {
            let keyName = `${parentKey}${key}`;
            if (typeof obj[key] === "object")
                flatObj(obj[key], keyName + ".", result);
            else result[keyName] = obj[key];
        }
    }
    return result;
}
console.log(flatObj(entry));
