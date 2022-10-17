setTimeout(function(){
    console.log('set1');
    queueMicrotask(()=>{
        console.log('set1 quere1')
        setTimeout(()=>{
            console.log("set1 quere sett")
        })
    })
    console.log('set1 2')
})

new Promise(function(resolve){
    console.log("pr1")
    resolve()
}).then(()=>{
    console.log("pr1 then")
    setTimeout(()=>{
        console.log("pr1 then set")
    })
})

async function async1(){
    console.log('async1');
    await xxx();
    console.log('async micro')
}
async1()

function xxx(){
    console.log("xxx")
}

console.log("main1")