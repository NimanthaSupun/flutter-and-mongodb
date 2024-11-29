
const express = require("express");
const Router = express.Router();
const userController = require("../controllers/userController")

Router.post("/users",userController.createUser);

module.exports = Router;

