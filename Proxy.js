// 对代理对象属性的读取与写入进行了拦截。
// let proxy = new Proxy(target,代理规则);
// get(target, 访问的属性 ,xxx) {}  访问target属性时触发
// set(target, 设置的属性 ,设置的值,xxx) {} 设置target属性时触发
// has(target,key) Reflect.has() || 'a' in proxy时可触发
const proxy1 = new Proxy(
    {
        a: 1,
        c: 3,
    },
    {
        get(target, key) {
            if (Reflect.has(target, key)) { // 新 判断target中是否含有该访问的属性
                return Reflect.get(target, key); //获取target 的 该属性的值
            } else {
                return false;
            }
        },
        set(target,key,val){
            if (!Reflect.has(target, key)) { 
                console.log('创建新属性')
                return Reflect.set(target, key,val);
            } else {
                console.log('更新成功')
                return Reflect.set(target, key,val);
            }
        },
        has(target, key) {
            console.log('触发has拦截')
            return key in target;
        }
    }
)
console.log(proxy1.a) //1
proxy1.d = 10;
proxy1.d = 100;
console.log(proxy1.b) //false
// console.log('aff' in proxy1);
Reflect.has(proxy1, 'a')

const onlyobj = {};
Object.defineProperty(onlyobj, 'a', {
    value: 123,
    writable: true,
    configurable:false,
});
const proxy2 = new Proxy(onlyobj,{
        get(target, key) {
            if (Reflect.has(target, key)) { // 新 判断target中是否含有该访问的属性
                return Reflect.get(target, key); //获取target 的 该属性的值
            } else {
                return false;
            }
        },
        set(target,key,val){
            if (!Reflect.has(target, key)) { 
                console.log('创建新属性')
                return Reflect.set(target, key,val);
            } else {
                console.log('更新成功')
                return Reflect.set(target, key,val); //target  writable == false ，Reflect.set 方法无效
            }
        }
    }
)
console.log(proxy2.a) //1
proxy2.a = 10;
// proxy2.d = 100;
console.log(proxy2.a) //false