import mogoose=require('mongoose');

mogoose.connection.on('connected',()=>{
    console.log("mongoose connected");
});

mogoose.connection.on('err',(e)=>{
    console.log("mongoose connection error",e);
});

mogoose.connection.on('disconnected',()=>{
    console.log("mongoose disconnected");
});

export function connect() {
    return mogoose.connect("mongodb://127.0.0.1/sampleAppDb");
}