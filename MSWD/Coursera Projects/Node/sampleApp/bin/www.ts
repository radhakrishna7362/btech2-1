import app from '../server';
import {connect} from '../dbconnection';

connect();
app.listen(1337,'localhost',(err)=>{
    if(err) console.log("error starting server",err);
    else
    console.log("server stated successfully on http://localhost:1337");
});