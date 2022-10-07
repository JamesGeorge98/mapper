const mongoose = require("mongoose")

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },

    email: {
        required: true,
        type: String,
        trim: true,
        // validate: {
        //     validate: (value) => {
        //         const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        //         value.match(re);
        //     },
        //     message: "please enter a valid email"
        // }
    },

    password: {
        required: true,
        type: String,
    },

    address: {
        required: true,
        type: String,
    }
});

const User = mongoose.mongoose.model("User",userSchema)
module.exports = User;
