"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const server_1 = require("../server");
const dbconnection_1 = require("../dbconnection");
dbconnection_1.connect();
server_1.default.listen(1337, 'localhost', (err) => {
    if (err)
        console.log("error starting server", err);
    else
        console.log("server stated successfully on http://localhost:1337");
});
//# sourceMappingURL=www.js.map