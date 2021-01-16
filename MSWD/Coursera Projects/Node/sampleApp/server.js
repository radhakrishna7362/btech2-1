"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const bodyParser = require("body-parser");
var app = express();
const authRoutes_1 = require("./routes/authRoutes");
const authMiddleware_1 = require("./authMiddleware");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(authMiddleware_1.authMiddleware);
app.use('/api/auth', authRoutes_1.default);
app.get('/test', (req, res) => {
    res.send("test successfully called");
});
exports.default = app;
//# sourceMappingURL=server.js.map