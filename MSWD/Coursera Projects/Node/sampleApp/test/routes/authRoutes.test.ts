import should=require('should');
import mongoose = require('mongoose');
import request =require('supertest');

import app from '../../server';
import { User } from '../../models/User';

var connectionString = 'mongodb://127.0.0.1/sampleAppDbTest';

describe('signup',()=>{
    before('clean up setup Signup',(done)=>{
        mongoose.connect(connectionString,()=>{
            mongoose.connection.db.dropDatabase(done);
        });
    });
    it('/api/auth/signup',(done)=>{
        request(app)
            .post('/api/auth/signup')
            .send({
                name: 'afa',
                password: 'pass',
                email: 'afa@gmail.com'
            })
            .expect(200)
            .end((err,response)=>{
                if(err) {
                    return done(err);
                }else{
                    console.log(response.body);
                    // should(response.body.name).be.a.NaN();
                    done();
                }
            });
    });
});

describe('signin',()=>{
    before('clean up setup SignIn',(done)=>{
        mongoose.connection.db.dropDatabase();
        User.create({
            name: 'afa',
            password: 'pass',
            email: 'afa@gmail.com'
        },done);
    });
    it('/api/auth/signin should be successful',(done)=>{
        request(app)
            .post('/api/auth/signin')
            .send({
                password:"pass",
                email:"afa@gmail.com"
            })
            .expect(200)
            .end((err,response)=>{
                if(err) return done(err)
                should(response.body.token).be.a.String();
                done();
            });
    });
    it('/api/auth/signin should fail when wrong password',(done)=>{
        request(app)
            .post('/api/auth/signin')
            .send({
                password:"wrongPassword",
                email:"afa@gmail.com"
            })
            .expect(403)
            .end((err,response)=>{
                if(err) return done(err)
                should(response.body.token).not.be.a.String();
                should(response.body.message).be.equal('email or password incorrect');
                done();
            });
    });    
});

describe('me',()=>{
    let authToken;
    before('clean up setup',(done)=>{
        mongoose.connection.db.dropDatabase();
        User.create({
            name: 'alex',
            password: 'pass',
            email: 'alex@gmail.com'
        },(err, user)=>{
            request(app)
                .post('/api/auth/signin')
                .send({
                    password:"pass",
                    email:"alex@gmail.com"
                })
                .expect(200)
                .end((err,response)=>{
                    if(err) return done(err)
                    should(response.body.token).be.a.String();
                    authToken = response.body.token;
                    // console.log(authToken);
                    done();
                });
        });
    });
    it('/api/auth/me should be successful',(done)=>{
        request(app)
            .get('/api/auth/me')
            .set('Authorization',authToken)
            .expect(200)
            .end((err,response)=>{
                if(err) return done(err)
                should(response.body).containEql({
                    name:'alex',
                    email:'alex@gmail.com'
                })
                done();
            });
    });
});