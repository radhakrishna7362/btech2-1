"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const User_1 = require("../models/User");
const Session_1 = require("../models/Session");
const uuid = require("node-uuid");
const authMiddleware_1 = require("../authMiddleware");
var router = express_1.Router();
router.post('/signup', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        var createdUser = yield User_1.User.create({
            name: req.body.name,
            email: req.body.email,
            password: req.body.password
        });
    }
    catch (err) {
        res.status(401).send(err);
    }
    res.send(createdUser);
}));
router.post('/signin', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        var foundUser = yield User_1.User.findOne({
            email: req.body.email
        }).exec();
        if (foundUser.password !== req.body.password)
            return res.status(403).send({ message: "email or password incorrect" });
        var createdSession = yield Session_1.Session.create({ user: foundUser._id, sid: uuid.v1() });
        return res.send({ token: createdSession.sid });
    }
    catch (err) {
        return res.status(401).send(err);
    }
}));
router.get('/me', authMiddleware_1.isAuthenticated, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        var foundUser = yield User_1.User.findById(req.user._id);
    }
    catch (err) {
        return res.status(401).send(err || 'error finding user');
    }
    return res.send(foundUser);
}));
router.post('/greet', (req, res) => {
    var name = req.body.name;
    greet(name)
        .then((result) => {
        res.send(result);
    }, (err) => {
        res.status(400).send(err);
    });
});
var greet = (name) => {
    return new Promise((resolve, reject) => {
        if (name) {
            resolve('hello ' + name);
        }
        else {
            reject(new Error('name needs to be defined'));
        }
    });
};
exports.default = router;
//# sourceMappingURL=authRoutes.js.map