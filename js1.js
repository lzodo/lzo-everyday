"$max($b1,$b2,$b3)fdsfa$max(aaa)".replace(
    /(?<=\$.+\([^\)].+)\)|(?<=\$.+)\(/g,
    (a)=> {
        if(a=='('){
            return '['
        }else{return "]"}
    }
);

//将 $xxx(xxx)的小括号变中括号
"$max($b1,$b2,$b3)fun()fdsfa$min(random))ext()".replace(/(?<=\$(min|max)\([^\)\(]+)\)|(?<=\$(min|max))\(/g,(a)=> {if(a=='('){return '['}else if(a==")"){return "]"}})
"$max($b1,$b2,$b3)fun()fdsfa$min(random))ext()".replace(/(?<=\$.+\([^\)\(]+)\)|(?<=\$[^\(\)]+)\(/g,(a)=> {if(a=='('){return '['}else if(a==")"){return "]"}})
