const mongoose=require('mongoose');

const Schema=mongoose.Schema;

let harryPotterSchema=new Schema(
    {
        name:{
            type:String,
            required:true
        },
        speices:{
            type:String
        },
        gender:{
            type:String
        },
        house:{
            type:String
        },
        dateOfBirth:{
            type:String
        },
        eyeColour:{
            type:String
        },
        wand:{
            wood:{
                type:String
            },
            core:{
                type:String
            },
            length:{
                type:String
            }
        }
    }
)

harryPotterSchema = mongoose.model("characters",harryPotterSchema);

module.exports=harryPotterSchema;