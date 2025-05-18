const express=require("express");

const path=require('path');
const app=express();
app.use(express.json());

// Serve static files from the frontend folder
app.use(express.static(path.join(__dirname, 'Frontend.js')));
const cors=require("cors");
app.use(cors());
app.options("*",cors());

const registration= require("./RegistrationCus");
const Login1=require("./Login1");
const search=require("./Search");
const visitorsrecords = require("./VisitsRecords");
const booking = require("./Booking");
const recommendation = require("./Recommendation");

app.use("",registration);
app.use("",Login1);
app.use("",search);
app.use("",visitorsrecords);
app.use("",booking);
app.use("",recommendation);


const port=process.env.PORT || 3000
   app.listen(port,function()
   {
   console.log(`Listening on the port ${port}`);
   })

