const express=require("express");
require("./connectionfile");
const app=express();
const port=process.env.PORT || 8000;

app.post("/firstrestapi",(request,response)=>{
    response.send('Hello First RestFull Api');
})

app.listen(port,()=>{
    console.log(`connection is setup at ${port}`);
})