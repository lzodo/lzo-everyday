let i;
for (i = 0; i < 3; i++) {
  var log = (j) => {
    console.log(j);
  }
  setTimeout(function(i){
    log(i)
  }, 100);
}