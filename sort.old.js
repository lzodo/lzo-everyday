/*
 * 通过参数动态获取排班时间
 * @author：kevinInsight 20180411
 */

/*
 * 获取当天及之后的排班时间
 * @param dayCount:相对于今天的天数，形如：0,1,2.......
 */
function getDateData(dayCount) {
    var d = new Date();
    d.setDate(d.getDate() + dayCount);
    var y = d.getFullYear();
    var m = d.getMonth() + 1 > 9 ? d.getMonth() + 1 : "0" + (d.getMonth() + 1);
    var d = d.getDate() > 9 ? d.getDate() : "0" + d.getDate();
    return y + "-" + m + "-" + d;
}
/*
 * 获取日期对应的星期名称
 * @param date:待转换日期,形如：'2018-04-11' 或 '2018-4-11'
 */
function dateToDay(date) {
    var dayNo = new Date(date).getDay();
    switch (dayNo) {
        case 0:
            return "星期日";
            break;
        case 1:
            return "星期一";
            break;
        case 2:
            return "星期二";
            break;
        case 3:
            return "星期三";
            break;
        case 4:
            return "星期四";
            break;
        case 5:
            return "星期五";
            break;
        case 6:
            return "星期六";
            break;
        default:
            break;
    }
}
/*
 * 获取排班日期
 * @param weekCount:排班周数，int型
 * @param domId: 输出DomId
 */
function initWeekData(weekCount, domId) {
    var weekDateTempl = "",
        tableTempl = "",
        tableTh = "",
        tableTd = "",
        tableTdArr = [],
        weekData = [],
        weekDataFinal = [],
        weekDateEle;
    for (var i = 0; i < weekCount * 7; i++) {
        weekData[i] = getDateData(i);
    }
    for (var i = 0; i < weekData.length; i = i + 7) {
        weekDataFinal.push(weekData.slice(i, i + 7));
    }
    weekDataFinal.forEach(function (item, index) {
        if (index === 0) {
            for (var i = 0; i < item.length; i++) {
                tableTh += "<th>" + dateToDay(item[i]) + "</th>";
            }
            tableTh = "<tr>" + tableTh + "</tr>";
            //firstWeek
            for (var j = 0; j < item.length; j++) {
                if (j === 0) {
                    tableTd +=
                        "<td attr-date=" +
                        item[j] +
                        ' class="active">今天</td>';
                } else {
                    tableTd +=
                        "<td attr-date=" +
                        item[j] +
                        ">" +
                        new Date(item[j]).getDate() +
                        "</td>";
                }
            }
            tableTd = "<tr>" + tableTd + "</tr>";
            tableTdArr[index] = tableTd;
            tableTd = "";
        } else {
            for (var k = 0; k < item.length; k++) {
                tableTd +=
                    "<td attr-date=" +
                    item[k] +
                    ">" +
                    new Date(item[k]).getDate() +
                    "</td>";
            }
            tableTd = "<tr>" + tableTd + "</tr>";
            tableTdArr[index] = tableTd;
            tableTd = "";
        }
    });
    tableTempl = tableTh + tableTdArr.join("");
    weekDateEle = document.querySelector("#" + domId);
    weekDateEle.innerHTML = tableTempl;
    weekDateEle.querySelectorAll("tr>td").forEach(function (item, index) {
        item.addEventListener("click", function () {
            weekDateEle
                .querySelectorAll("tr>td")
                .forEach(function (item, index) {
                    item.classList.remove("active");
                });
            this.classList.add("active");
            alert(this.getAttribute("attr-date"));
        });
    });
}

//调用实例

//两周
initWeekData(2, "twoWeekDate");

//四周
// initWeekData(4, "fourWeekDate");
