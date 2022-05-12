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
    const stk = [];
    for (let ch of s){
        // 如果当前符号是结束括号
        if (pairs.has(ch)) {
            // 如果当前栈一个都没有 或 栈中最后一个不是与右括号匹配的左括号
            if (!stk.length || stk[stk.length - 1] !== pairs.get(ch)) {
                return false;
            }

            // 如果匹配删除左括号
            stk.pop();
        }
        else { //如果不是结束括号就添加到栈中
            stk.push(ch);
        }
    };
    return !stk.length;
};

console.log(isValid("(){}[{}]"));
