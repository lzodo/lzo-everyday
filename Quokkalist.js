function myInstanceof(left, right) {

    //基本数据类型直接返回false

    if(typeof left !== 'object' || left === null) return false;

    //getProtypeOf是Object对象自带的一个方法，能够拿到参数的原型对象

    let proto = Object.getPrototypeOf(left);

    console.log(proto)

    while(true) {

        //查找到尽头，还没找到

        if(proto == null) return false;

        //找到相同的原型对象

        if(proto == right.prototype) return true;

        proto = Object.getPrototypeOf(proto);

    }

}

// console.log(myInstanceof({},Object))



// console.log(Object.getPrototypeOf({}));

// console.log(Object.getPrototypeOf('111'));



// console.log(Object.prototype.toString.call({}))

// console.log(Object.prototype.toString.call('str'))

// console.log(Object.prototype.toString.call(111))

// console.log(Object.prototype.toString.call(null))



// console.log(Object.getPrototypeOf({}));

// console.log(Object.getPrototypeOf('str'));

// console.log(Object.getPrototypeOf(111));

// console.log(Object.getPrototypeOf(null));



var obj = {

    toString () {

      console.log('toString')
      return

    },

    valueOf () {

      console.log('valueOf')
      return {}

    },

    // [Symbol.toPrimitive] () {

    //     console.log('primitive')

    //     return 'primi'

    // }
  }
  console.log(String(obj))
  //console.log(obj) // string

  //console.log('1' + obj) // 1value



  //如果转换与数值有关

  //对象转基本类型,如果有重置[Symbol.toPrimitive],和valueOf与toString会先调用[Symbol.toPrimitive],如果[Symbol.toPrimitive]返回的不是原始值会再继续调用valueOf,如果还不是原始值就会调用toString,如果还不是原始值就会报错

  //如果没有[Symbol.toPrimitive]并且有valueOf和toString方法，先调用valueOf,如果valueOf返回的不是原始值会再继续调用toString,如果还不是原始值就会报错

  //如果没有valueOf并且有toString方法会调用toString方法,如果返回值不是原始值也会报错

  //得到这两个方法的返回值进行类型转换

  //如果转换与字符串更相关toString优先级打印valueOf,但[Symbol.toPrimitive]还是最高德
