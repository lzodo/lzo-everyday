    const getIndex = (reg, str) =>{
        let indexs = [], res = null;
        do {
            res = reg.exec(str);
            res && indexs.push([res.index, res.index + res[0].length])
        } while (res);
        return indexs;
    }

    let reg = /[a-z]+/g;
    let str = "123abc_def_ghi456";
    console.log(getIndex(reg, str)); //[ [ 3, 6 ], [ 7, 10 ], [ 11, 14 ] ]
