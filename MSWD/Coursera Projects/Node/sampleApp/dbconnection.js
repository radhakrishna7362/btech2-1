"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.connect = void 0;
const mogoose = require("mongoose");
mogoose.connection.on('connected', () => {
    console.log("mongoose connected");
});
mogoose.connection.on('err', (e) => {
    console.log("mongoose connection error", e);
});
mogoose.connection.on('disconnected', () => {
    console.log("mongoose disconnected");
});
function connect() {
    return mogoose.connect("mongodb://127.0.0.1/sampleAppDb");
}
exports.connect = connect;
//# sourceMappingURL=dbconnection.js.map