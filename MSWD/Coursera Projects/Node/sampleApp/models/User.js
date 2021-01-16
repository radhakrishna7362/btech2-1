"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.User = void 0;
const mongoose_1 = require("mongoose");
var userSchema = new mongoose_1.Schema({
    name: String,
    email: { type: String, unique: true },
    password: String
});
exports.User = mongoose_1.model('User', userSchema);
//# sourceMappingURL=User.js.map