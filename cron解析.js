/**
 * 不考虑这种 SUN, MON, TUE, WED, THU, FRI and SAT 单词表示法
 * 周选项中 1表示周日、2表示周一.....
 */


//  export default class CronFormat {
class CronFormat {
    constructor(cronstr) {
        this.formaterr = null;
        // this.isevery = [false, false, false, false, false, false];
        this.cronstr = cronstr
            .toString()
            .split(" ")
            .filter(item => !!item);
    }

    getString() {
        let res = "";

        if (!this.validator().visrule) {
            return this.validator().msg;
        }

        if(this.cronstr[3] == "?"&&this.cronstr[5] == "?") return "格式错误,周或天只能选一个";
        if (this.cronstr[5] == "?") {
            res = `${this.getMonth()} ${this.getDay()} ${this.getHour()} ${this.getMinutes()} ${this.getSeconds()}`;
        } else if (this.cronstr[3] == "?") {
            res = `${this.getMonth()} ${this.getWeek()} ${this.getHour()} ${this.getMinutes()} ${this.getSeconds()}`;
        } else {
            return "格式错误,周或天必须选一个";
        }

        if (this.formaterr) {
            return this.formaterr;
        }
        return res + "执行";
    }

    getSeconds() {
        // 解析秒
        return this.getValue(this.cronstr[0], "秒");
    }
    getMinutes() {
        // 解析分
        return this.getValue(this.cronstr[1], "分");
    }
    getHour() {
        // 解析时
        return this.getValue(this.cronstr[2], "时");
    }
    getDay() {
        // 解析日
        let sec = this.cronstr[3];
        let value = "";
        if (sec == "L") {
            value = `最后一天的`;
        } else if (sec == "LW") {
            value = `最后一工作日的`;
        } else if (/^\d{1,2}W$/.test(sec)) {
            value = `第${sec.split("W")[0]}个工作日`;
        } else if (/^\d{1,2}L$/.test(sec)) {
            value = `最后一个星期${sec.split("L")[0]}`;
        } else {
            value = this.getValue(sec, "日");
        }

        return value;
    }
    getMonth() {
        // 解析月
        return this.getValue(this.cronstr[4], "月");
    }
    getWeek() {
        // 解析周
        let sec = this.cronstr[5];
        let value = "";
        if (sec == "*") {
            value = "每周";
        } else if (sec.includes(",") || /^\d$/.test(sec)) {
            // 如果规则的周日是1,周六是7的的
            value = `周${this.changeWeek(sec)}`;
        } else {
            value = sec;
        }

        return value;
    }

    getValue(sec, unit) {
        let value = "";
        if (sec == "*") {
            value = `每${unit}`;
        } else if (/\d{1,2}-\d{1,2}/.test(sec)) {
            value = `${sec.split("-")[0]}到${sec.split("-")[1]}${unit}`;
        } else if (/\d{1,2}\/\d{1,2}/.test(sec)) {
            value = `从${sec.split("/")[0]}${unit}开始每隔${
                sec.split("/")[1]
            }${unit}`;
        } else if (sec.includes(",") || /^\d{1,}$/.test(sec)) {
            value = `${sec}${unit}`;
        } else {
            this.formaterr = `${sec} 处格式有误`;
        }

        return value;
    }

    changeWeek(sec) {
        let val = "";
        sec.split(",").forEach(item => {
            switch (Number(item)) {
                case 1:
                    val = val + "日,";
                    break;
                case 2:
                    val = val + "一,";
                    break;
                case 3:
                    val = val + "二,";
                    break;
                case 4:
                    val = val + "三,";
                    break;
                case 5:
                    val = val + "四,";
                    break;
                case 6:
                    val = val + "五,";
                    break;
                case 7:
                    val = val + "六,";
                    break;
            }
        });
        console.log(val.split(","));
        return val
            .split(",")
            .filter(item => item)
            .join("、");
    }

    validator() {
        if (this.cronstr.length < 6) {
            return { visrule: false, msg: "cron表达式最少6项" };
        }
        if (this.cronstr.length > 7) {
            return { visrule: false, msg: "cron表达式最多7项" };
        }
        if (/[^0-9\*\?\-\,\/#LCW]{1,}/.test(this.cronstr)) {
            return { visrule: false, msg: "存在字符不合法" };
        }
        return { visrule: true };
    }
}

let cro = new CronFormat("* * * * * ?");
console.log(cro.getString());
