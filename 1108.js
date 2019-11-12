function foo() {
    let a;  window.b = 0;  a = window.b;  a++;
    return a;
  }
  
  foo();
  typeof a;        // => 'undefined'
  typeof window.b; // => 'number'
