// function getInfo(name:string):void;
// function getInfo(age:number):void;
// function getInfo(str:any):void{
//     if(typeof str == "string"){
//         console.log("名字:",str)
//     }
//     if(typeof str == "number"){
//         console.log("年龄",str)
//     }
// }
// getInfo("zhangsan")


let obj: any = {};
function setInfo(val: string): void;
function setInfo(val: number): void;
function setInfo(val: boolean): void;
function setInfo(val: string | number | boolean): void {
  if (typeof val === "string") {
    obj.name = val;
  } else {
    obj.age = val;
  }
}
setInfo("Domesy");
setInfo(7);
setInfo(true);
console.log(obj); // { name: 'Domesy', age: 7 }
