"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.isAuthenticated = exports.authMiddleware = void 0;
const Session_1 = require("./models/Session");
function authMiddleware(req, res, next) {
    Session_1.Session.findOne({ sid: req.header('Authorization') })
        .populate('user')
        .exec((err, foundSession) => {
        if (foundSession) {
            req.user = foundSession.user;
            req['isAuthenticated'] = true;
            return next();
        }
        else {
            req.user = null;
            req['isAuthenticated'] = false;
            return next();
        }
    });
}
exports.authMiddleware = authMiddleware;
function isAuthenticated(req, res, next) {
    if (req['isAuthenticated'] === true && req.user._id) {
        return next();
    }
    else {
        console.log(401);
        return res.status(401).send({ message: 'Authenticated required' });
    }
}
exports.isAuthenticated = isAuthenticated;
//# sourceMappingURL=authMiddleware.js.map