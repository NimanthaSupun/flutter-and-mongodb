
const { json } = require("express");
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

// Get a single user
exports.getSingleUser = async (req, res) => {
    try{
        const userId = req.params.id.trim();
        const user = await User.findById(userId);

        if(!user){
         return res.status(404).json({message: "User not Found"});
        } else {
            res.json(user);
        }

    } catch (error){

    res.status(400).json({error: error.message});
    }
};

// Get all users
exports.getAllUsers = async (req, res) => {
    try {
        const users = await User.find();
        res.json(users);

    } catch (error) {
        res.status(400).json({error: error.message});
    }
}

// Update user
exports.updateUser = async (req, res) => {
    try {
        const userId = req.params.id.trim();
        const user = await User.findByIdAndUpdate(userId,req.body,{
            new: true,
            runValidators: true,
        });
        if(!user) {
         return res.status(404).json({message: "User not Found"});
        } else {
            res.json(user);
        }
    } catch (error) {
        res.status(400).json({error: error.message});
    }
}

// delete a user
exports.deleteUser = async (req, res) => {
    try {
        const userId = req.params.id.trim();
        const user = await User.findByIdAndDelete(userId);
        if(!user){
         return res.status(404).json({message: "User not Found"});
        } else {
            res.json({message: "User deleted successfully"});
        }
    } catch (error){
      res.status(400).json({error: error.message});
    }
}