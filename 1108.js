// function foo() {
//     let a;  window.b = 0;  a = window.b;  a++;
//     return a;
//   }
  
//   foo();
//   typeof a;        // => 'undefined'
//   typeof window.b; // => 'number'


function fun(number){
   for(var i = 0;i<number;i++){
       setTimeout(function(i){
         
        }(i),3000)
    }
}

fun(20);

const arr = [10, 12, 15, 21];

for (var i = 0; i < arr.length; i++) {
  setTimeout(function(i_local){
    return function () {
      console.log('The index of this number is: ' + i_local);
    }
  }(i), 3000)
}