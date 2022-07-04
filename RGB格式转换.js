function rgb2hex(sRGB) {
    sRGB = sRGB.replace(/ /g,""); //居然还要兼容 rgb(255,100,     100) 奇葩格式
    // 验证rgb并且他们不能超过255
    if (!/^rgb\((\d{1,2}|[0-1]\d{2}|2[0-4]\d{1}|25[0-5]),(\d{1,2}|[0-1]\d{2}|2[0-4]\d{1}|25[0-5]),(\d{1,2}|[0-1]\d{2}|2[0-4]\d{1}|25[0-5])\)$/.test(sRGB)) {
        return sRGB;
    }

    let e = /^rgb\((\d{1,2}|[0-1]\d{2}|2[0-4]\d{1}|25[0-5]),(\d{1,2}|[0-1]\d{2}|2[0-4]\d{1}|25[0-5]),(\d{1,2}|[0-1]\d{2}|2[0-4]\d{1}|25[0-5])\)$/.exec(sRGB);
    let rgbList = [e[1], e[2], e[3]];

    let res = "#";
    rgbList.forEach((item)=>{
        let before = Math.floor(Number(item) / 16);
        let after = Number(item) % 16;
        res += ""+getChart(before) + getChart(after)
    })
    return res;
}
function getChart(num) {
    let res = "";
    switch (num) {
        case 15:
            res = "f";
            break;
        case 14:
            res = "e";
            break;
        case 13:
            res = "d";
            break;
        case 12:
            res = "c";
            break;
        case 11:
            res = "b";
            break;
        case 10:
            res = "a";
            break;
        default:
            res = num;
    }
    return res;
}
console.log(rgb2hex("rgb(255,255,100)"));



// 获取随机颜色， (数字).toString() 必须括号起来
const randomColor = () => {
    return '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6);
}
console.log(randomColor())
