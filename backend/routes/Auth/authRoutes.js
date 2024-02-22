const express = require('express');
const router = express.Router();
const { User } = require('../../models/User'); // Import User model
const {
    signUpUser,
    signInUser,
    getUser,
} = require('../../controller/authController')
const { verifyUser } = require('../../middleware/middleware')

// ... Authentication routes defined here
router.post('/signup', signUpUser);

router.post('/signin', signInUser);

router.route('/me').get([verifyUser], getUser)


module.exports = router;
