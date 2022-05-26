var _ = require("lodash");
var users = [
    { user: "barney", age: 36 },
    { user: "fred", age: 40 },
    { user: "pebbles", age: 1 },
];

var youngest = _.chain(users)
    .sortBy("age")
    .map(function (o) {
        return o.user + " is " + o.age;
    })
    .head()
    .value();
// => 'pebbles is 1'

console.log(_.sum([1,2,3,4]))
