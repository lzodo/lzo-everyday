function getInfo(name:string):void;
function getInfo(age:number):void;
function getInfo(str:any):void{
    if(typeof str == "string"){
        console.log("名字:",str)
    }
    if(typeof str == "number"){
        console.log("年龄",str)
    }
}
getInfo("zhangsan")
