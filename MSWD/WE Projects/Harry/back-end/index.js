const express=require('express');
const cors=require('cors');
const mongoose=require('mongoose');
const bodyParser=require('body-parser');

mongoose.connect('mongodb+srv://rk:190031187@first.cpozf.mongodb.net/harrypotter?retryWrites=true&w=majority',{useCreateIndex:true,useFindAndModify:true,useNewUrlParser:true,useUnifiedTopology:true},()=>{
    console.log("Connected to database")
})

const app=express();
const port=3000;

app.use(cors());
app.use(bodyParser.json());

// app.get('/',(req,res)=>{
//     res.send('Hello this is my fisrt route');
// })

app.listen(port,()=>{
    console.log(`Successfully running on port http://localhost:${port}`)
})