import {Session} from './models/Session';
import {Request,Response} from 'express';

export function authMiddleware(req,res:Response,next:Function){
    Session.findOne({sid:req.header('Authorization')})
        .populate('user')
        .exec((err,foundSession)=>{
            if(foundSession){
                req.user=foundSession.user;
                req['isAuthenticated']=true;
                return next();
            } else{
                req.user=null;
                req['isAuthenticated']=false;
                return next();
            }
        })
}

export function isAuthenticated(req,res:Response,next:Function){
    if(req['isAuthenticated']===true && req.user._id){
        return next();
    }else{
        console.log(401);
        return res.status(401).send({message:'Authenticated required'});
    }
}