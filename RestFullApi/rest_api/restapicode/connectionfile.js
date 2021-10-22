const mongoose=require("mongoose");

mongoose.connect("mongodb://localhost:27017/restapidb",{
}).then(()=>
{
console.log("connection Established");
}).catch((e)=>{
console.log("Connection Error");
})