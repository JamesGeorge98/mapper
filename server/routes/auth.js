const express = require("express")
const User = require("../models/user")

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
    const { name, email, password, address } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
        return res.status(400).json({ msg: "already exist" })
    };

    let user = new User({
        email,
        password,
        name,
        address
    });

    user = await user.save();
    res.json({ msg: "Account Created" });
});


authRouter.post("/api/signin", async (req, res) => {
    const { email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
        if (existingUser.password == password) {
            return res.json({ msg: "logged in ", status: true })
        } else {
            return res.json({ msg: "Check password", status: false })
        }
    } else {
        return res.json({ msg: "User not exist", status: false })
    }
});


authRouter.post("/api/profile", async (req, res) => {
    const { email } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
        return res.json(existingUser)
    } else {
        return res.json({ msg: "User not exist" })
    }
});


authRouter.post("/api/profileupdate", async (req, res) => {
    const update = { name: req.body.name, password: req.body.password, address: req.body.address}
    const filter = { email: req.body.email }
    const updatedDocument = await User.findOneAndUpdate(filter, update, { new: true });
    return res.status(200).send(updatedDocument);
    
});

module.exports = authRouter;