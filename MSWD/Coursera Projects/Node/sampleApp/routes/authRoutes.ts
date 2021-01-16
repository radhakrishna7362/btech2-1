import {Router,Request,Response} from 'express'
import {User} from '../models/User';
import { Session } from '../models/Session';
import uuid= require("node-uuid");
import {isAuthenticated} from '../authMiddleware';

var router=Router();

router.post('/signup',async(req:Request,res:Response)=>{
    
    try{
        var createdUser = await User.create({
            name: req.body.name,
            email: req.body.email,
            password: req.body.password
        })
    } catch(err){
        res.status(401).send(err);
    }

    res.send(createdUser);
});

router.post('/signin',async(req,res)=>{
    try{
        var foundUser= await User.findOne({
            email: req.body.email
        }).exec()

        if(foundUser.password!==req.body.password) 
            return res.status(403).send({message:"email or password incorrect"});

        var createdSession= await Session.create({user: foundUser._id,sid: uuid.v1()})
            return res.send({token:createdSession.sid});
    } catch(err){
        return res.status(401).send(err);
    }
});

router.get('/me',isAuthenticated,async(req,res)=>{
    try{
        var foundUser= await User.findById(req.user._id)
    } catch(err){
        return res.status(401).send(err || 'error finding user');
    }
    return res.send(foundUser);
});

router.post('/greet',(req,res)=>{
    var name=req.body.name;
    greet(name)
        .then((result)=>{
            res.send(result);
        },(err)=>{
            res.status(400).send(err);
        })
});
var greet = (name)=>{
    return new Promise((resolve,reject)=>{
        if(name){
            resolve('hello ' + name);
        } else {
            reject(new Error('name needs to be defined'));
        }
    })
}

export default router;