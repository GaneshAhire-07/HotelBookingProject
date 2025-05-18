const express=require("express");
const mysql=require("mysql2");
const Joi=require("joi");
const router = express.Router();

const con=mysql.createConnection(
    {
  host: "127.0.0.1",
  port:3306,
  user: "root",
  password: "dhanraj0304",
  database: "Hotel_Booking",
    }
);
con.connect((err)=>{
    if(err)
    {
        console.log("Not Connected to the Database",err);
    }
    else
    {
        console.log("Connected to the Users Table");
    }
});

//Middleware for input validation using joi

const validationSignup=(req,res,next)=>{
const schema=Joi.object().keys({
  
    Email:Joi.string().email().required().label('Email Address').messages(
        {
            'string.email': '{#label} must be a valid email address',
             'any.required':'{{#label}}is required',
            'string.base':'"{{#label}}"must be a string'
        }),

    CustomerName:Joi.string().required().label('Customer Name').messages(
        {
                
                'any.required':'{{#label}}is required',
                'string.base':'"{{#label}}"must be a string'
        }),

    Pass:Joi.string().min(8).max(15).required().label('Password').regex(/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/).messages(
           { 
            'string.min':'"{{#label}}" minimum 8 chracters',
            'string.max':'"{{#label}}" maximum 15 characters',
            'any.required':'"{{#label}}" is required',
            'string.pattern.base':'"{{#label}}" must start with the letter and includes at least one letter,one number and one special character'
            }),
     
    ConfirmPass: Joi.string().valid(Joi.ref('Pass')).required().label('Confirm Password').messages(
                {
                    'any.only': 'Password and {#label} not match',
                    'any.required':'{#label} is required'
                }),
    
    Phoneno:Joi.number().integer().min(6000000000).max(9999999999).required().label('Phone Number').messages(
    {
    'number.base':'{#label} must ba a number',
    'number.integer.base':'{#label} must be a integer',
    'number.min':'{#label} first digit start with 6 to 9 and must contains 10 digits',
    'number.max':'{#label} must be 10 digits',
    'any.required': '{#label} is required'
    })
    })

const{error}=schema.validate(req.body);

     if(error)
    {
        
        return res.status(400).json({
        Error: error.details[0].message,
       })
    }

    next();
}

router.post('/api/Sign_Up',validationSignup,async(req,res)=>
{
    const {Email,CustomerName,Phoneno,Pass}=req.body;
    con.query('insert into Users(email,username,PhoneNo,Password) values(?,?,?,?)'
    ,[Email,CustomerName,Phoneno,Pass],(err,result)=>{

        if(err)
    {
      console.log("MySQL Query Error",err);
      return res.status(500).json({
        Error:"Internal Server Error"
      })
    }

    else
    {
       console.log(result);
       return res.status(200).json({
        Message:"SignUp Successful"
    });
    }

})
})

module.exports = router;



  
