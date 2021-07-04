//获取今天 到今天加 n 天的日期
function getDateData(dayCount) {
    var d = new Date();
    //getDate() 方法可返回月份的某一天
    d.setDate(d.getDate() + dayCount);
    var y = d.getFullYear();
    var m = d.getMonth() + 1 > 9 ? d.getMonth() + 1 : "0" + (d.getMonth() + 1);
    var d = d.getDate() > 9 ? d.getDate() : "0" + d.getDate();
    return y + "-" + m + "-" + d;
}

//获取今天星期几
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

function initWeekData(weekCount, domId,person) {
    var weekDateTempl = "",
        tableTempl = "",
        tableTh = "",
        tableTd = "",
        tableTdArr = [], //储存生成好后的每一行html
        weekData = [],//今天开始向后n天日期
        weekDataFinal = [], //七天一组容器
        weekDateEle, //容器
        personDataFinal=[],
        personData=[];
    //指定多长时间
    for (var i = 0; i < weekCount * 7; i++) {
        weekData[i] = getDateData(i);
        if(person[i]){
            personData[i] = person[i]
        }else{
            personData[i] = person[i%person.length]
        }

    }
    console.log(personData);



    //所有得到的日期分为七个一组
    for (var i = 0; i < weekData.length; i = i + 7) {
        weekDataFinal.push({date:weekData.slice(i, i + 7),person:personData.slice(i, i + 7)});

    }

    console.log(weekDataFinal);

    weekDataFinal.forEach(function (item, index) {
        //第一周 处理表头与第一格
        if (index === 0) {
            for (var i = 0; i < item.date.length; i++) {
                tableTh += "<th>" + dateToDay(item.date[i]) + "</th>";
            }
            tableTh = "<tr>" + tableTh + "</tr>";
            //firstWeek
            for (var j = 0; j < item.date.length; j++) {
                if (j === 0) {
                    tableTd +=

                        `<td attr-date=${item.date[j]} class="active">今天<span class='yg td'>${item.person[j]}</span></td>`
                } else {
                    tableTd +=

                        `<td attr-date=${item.date[j]}>${new Date(item.date[j]).getDate()}<span class='yg'>${item.person[j]}</span></td>`
                }
            }
            tableTd = "<tr>" + tableTd + "</tr>";
            tableTdArr[index] = tableTd;
            tableTd = "";
        } else {
            for (var k = 0; k < item.date.length; k++) {
                tableTd +=
                    `<td attr-date=${item.date[k]}>${new Date(item.date[k]).getDate()}<span class='yg'>${item.person[k]}</span></td>`
            }
            tableTd = "<tr>" + tableTd + "</tr>";
            tableTdArr[index] = tableTd;
            tableTd = "";
        }
    });
    tableTempl = tableTh + tableTdArr.join("");
    weekDateEle = document.querySelector("#" + domId);
    weekDateEle.innerHTML = tableTempl;
}


let persons = ['保安 一','保安 二','yuan三']
initWeekData(5, "twoWeekDate",persons);
