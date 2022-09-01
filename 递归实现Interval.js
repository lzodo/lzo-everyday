
function myInterval(callback,times){
    // window.requestAnimationFrame(myInterval)
    let sm = new Date().getTime();
    callback();
}

myInterval(()=>{
    console.log(1)
},2000)