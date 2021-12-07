// 固定时间执行定时器
// 利用定时器监听到某个时间点时触发另外一个定时器

const ListenerTime = 1000 * 60 * 2; //监控的执行间隔时间   每小时
var StartTime = 1000 * 60 * 60 * 24; //正式启动后的执行间隔时间   每天 24小时

var RunInterval,runTime,hh=11,mm=34;


/**
 *	启动的入口
 */
function run() {
    console.log("正在启动监听....");
    //直接符合条件不开定时器
    if(runCode()){
        return false;
    }

    runTime = setInterval(function () {
        runCode();
    }, ListenerTime);
}

/**
 * run定时器中要做的事情
 */

function runCode(){
    console.log("监听中....第" + getTime("hh") + "小时" + ",当前是第 " + getTime("mm") + " 分," + getTime("ss") + " 秒");
    if (getTime("hh") == hh) {
        //当系统时间是中午12点启动，如果是特定的其他时间可按需改动
        if(getTime("mm") == mm||getTime("mm") == mm+1){
            runTime&&clearInterval(runTime); //清除监控的定时器
            console.log("找到执行时间,当前过 1000 * 60 * 60 * 24 毫秒再次执行,已关闭监听");
            StartInterval(); //启动要执行的方法
            return true;
        }
    }
}

/**
 *  到监控时间后所要启动的定时器
 */
function StartInterval() {
    main();
    RunInterval = setInterval(function () {
        main();
    }, StartTime);
}

/**
 *  主要执行的函数内容
 */
function main() {
    console.log(new Date() + "正式执行");
}

/**
 *	关闭主要执行的定时器
 * 	需要额外调用来关闭主程序
 */
function closeInterval() {
    clearInterval(RunInterval);
    console.log("已关闭执行程序");
}

/** 获取系统时间的方法  **/

/**
 *
 * @param {Object} time  想要获取时分秒的判断参数
 * YY 年;MM 月;DD 日;hh 时;mm 分;ss 秒;
 *
 * return   返回类型为Number型,若参数正确，返回-1
 */
function getTime(time) {
    var datetime = new Date();
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1;
    var day = datetime.getDate();
    var Hours = datetime.getHours();
    var Minutes = datetime.getMinutes();
    var Seconds = datetime.getSeconds();

    switch (time) {
        case "YY":
            return year;
            break;
        case "MM":
            return month;
            break;
        case "DD":
            return day;
            break;
        case "hh":
            return Hours;
            break;
        case "mm":
            return Minutes;
            break;
        case "ss":
            return Seconds;
            break;
        default:
            return -1;
    }
}

//模拟启动
run();
