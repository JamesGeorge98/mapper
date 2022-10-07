// importing packages
const express = require("express");
const mongoose = require("mongoose");

// import other file
const authRouter = require('./routes/auth.js')


//init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://test:root123@cluster0.n30cvuv.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose.connect(DB).then(() => {
    console.log("connection Successful");
});



app.listen(PORT,"0.0.0.0", () => {
    console.log(`connected at port ${PORT}`)
});