const mongoose=require("mongoose");

const apischema=new mongoose.Schema({
    name:{
        type:String,
        required:true,
    },
    type:{
        type:String,
        required:true
    }
})
// new collection for mongodb database

const Apis=new mongoose.model('Data',apischema);

module.exports=Apis;
