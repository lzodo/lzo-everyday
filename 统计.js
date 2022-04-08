function count(n) {
    let counts = 0;
    for (let i = 1; i <= n; i++) {
        (i+"").split("").forEach((item)=>{
            if(item == 1){
                counts++
            }
        })
    }
    return counts;
}
console.log(count(13));
