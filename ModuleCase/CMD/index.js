define(function(require,exports,module) {
    'use strict';
    const foo = require("./modules/foo");

    console.log(foo.name);
    console.log(foo.age);
});