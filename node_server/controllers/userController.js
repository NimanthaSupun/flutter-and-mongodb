
const User = require("../models/userModel")

// create user
exports.createUser = async (req, res) => {
    try {

        const user = new User(req.body);
        // store the user in the database
        await user.save();

        res.status(201).json(user);

    } catch (error) {
        res.status(400).json({error: error.message});
    }
};