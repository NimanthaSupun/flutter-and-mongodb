
const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController")

router.post("/users",userController.createUser);
router.get("/users/:id",userController.getSingleUser);
router.get("/users",userController.getAllUsers);
router.put("/users/update/:id",userController.updateUser);
router.delete("/users/delete/:id",userController.deleteUser);

module.exports = router;


