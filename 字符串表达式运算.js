function comp(data, str) {
    let pamList = str.split("");
    let keys = Object.keys(data);
    let arr = [];

    let groupList = "";
    pamList.forEach((item, index) => {
        if (/[a-zA-Z]/.test(item)) {
            if (index != 0 && !/[a-zA-Z]/.test(pamList[index - 1])) {
                groupList += ",";
            }
            groupList += item;
        } else {
            if (/[a-zA-Z]/.test(pamList[index - 1])) {
                groupList += ",";
            }
            groupList += item;
        }
    });

    console.log(groupList, 3333);

    groupList.split(",").forEach((item, index) => {
        keys.includes(item) ? arr.push(data[item]) : arr.push(item);
    });

    console.log(arr, 444444444444);

    let level = {
        level_1: ">",
        level_2: "<",
        level_3: "&&",
    };

    console.log(recurCount(arr, 1, level));
}

function recurCount(arr, num, level) {
    let newList = [];
    for (let i = 0; i < arr.length; i++) {
        if (num == 1) {
            if (arr[i] == ">") {
                //如果设定 > 第一个算
                newList.push(arr[i - 1] > arr[i + 1]);
            } else if (arr[i + 1] != ">" && arr[i - 1] != ">") {
                newList.push(arr[i]);
            }
        }
        if (num == 2) {
            if (arr[i] == "<") {
                //如果设定 < 第二个算
                newList.push(arr[i - 1] < arr[i + 1]);
            } else if (arr[i + 1] != "<" && arr[i - 1] != "<") {
                newList.push(arr[i]);
            }
        }
        if (num == 3) {
            // console.log(arr,900000000000000)
            if (arr[i] == "&&") {
                newList.push(arr[i - 1] && arr[i + 1]);
            } else if (arr[i + 1] != "&&" && arr[i - 1] != "&&") {
                newList.push(arr[i]);
            }
        }
    }
    if (num < Object.keys(level).length) {
        return recurCount(newList, num + 1, level);
    } else {
        return newList;
    }
}


comp({ aa: -4, b: 10, c: 3 }, "aa>b&&aa>c&&false");
