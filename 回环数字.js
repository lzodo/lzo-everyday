let Arr = new Array(10000).fill("")
//找到 121  1221
Arr.forEach((item,i)=>{
    let str = i.toString();
    let reg = "";
    if(str.length == 2){
        reg = /(\d)\1/
    }else if(str.length == 3){
        reg = /(\d)\d\1/
    }else if(str.length == 4){
        reg = /(\d)(\d)\2\1/
    }

    if(reg&&reg.test(str)){
        console.log(i)
    }
})
