let xhr = null;
if (window.XMLHttpRequest) {
    //Firefox、 Opera、 IE7 和其它浏览器使用本地 JavaScript 对象
    xhr = new XMLHttpRequest();
} else {
    //IE 5 和 IE 6 使用 ActiveX 控件
    var request = new ActiveXObject("Microsoft.XMLHTTP");
}
// 第二步：打开请求地址，初始化数据
xhr.open("POST", "http://192.168.3.41:8090/energyDevice/showAll", true);
xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
// 第三步：发送请求数据
xhr.send({ "selectby": null, "pageNumber": 1, "pageSize": 10 });
// 第四步：监听回调函数状态
xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
        // 收到服务器返回的应答结果
        console.log(xhr.responseText);
    }
};
