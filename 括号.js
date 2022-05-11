// 一种括号验证
function visBrackets(str, left, right) {
    let list = str.split("");
    let stack = [];
    for (let i = 0; i < list.length; i++) {
        if (list[i] == left) {
            stack.push(1);
        } else if (list[i] == right) {
            if (stack.length > 0) {
                stack.pop();
            } else {
                return false;
            }
        }
    }
    if (stack.length == 0) {
        return true;
    } else {
        return false;
    }
}

// console.log(visBrackets("123(()556)(())999", "(", ")"));

// 多种括号验证
// function visBrackets2(str, left, right) {
//     let list = str.split("");
//     // let reg = /\(|\{|\[/;
//     let stack = [];
//     for (let i = 0; i < list.length; i++) {
//         switch (list[i]) {
//             case "(":
//                 stack.push(1);
//                 break;
//             case "[":
//                 stack.push(2);
//                 break;
//             case "{":
//                 stack.push(3);
//                 break;
//             case ")":
//                 stack.push(-1);
//                 break;
//             case "]":
//                 stack.push(-2);
//                 break;
//             case "}":
//                 stack.push(-3);
//                 break;
//         }
//         // if (list[i] == "(") {
//         //     stack.push(1);
//         // } else if (list[i] == right) {
//         //     if (stack.length > 0) {
//         //         stack.pop();
//         //     } else {
//         //         return false;
//         //     }
//         // }
//     }
//     console.log(stack)
//     if(stack.length % 2 !=0){
//         return false;
//     }else{

//     }
// }
var isValid = function(s) {
    const n = s.length;
    if (n % 2 === 1) {
        return false;
    }
    const pairs = new Map([
        [')', '('],
        [']', '['],
        ['}', '{']
    ]);
    console.log(pairs)
    const stk = [];
    for (let ch of s){
        // console.log(ch)
        if (pairs.has(ch)) {
            if (!stk.length || stk[stk.length - 1] !== pairs.get(ch)) {
                return false;
            }
            stk.pop();
        }
        else {
            stk.push(ch);
        }
    };
    return !stk.length;
};

console.log(isValid("(){}[{]}"));
