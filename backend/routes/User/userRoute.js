const express = require('express');
const router = express.Router();
const { verifyUser } = require('../../middleware/middleware')

const { getServices, getUserOrders, addUserOrder, getUser, updateUser, verifyCoupen } = require('../../controller/User/userController')
router.get('/', (req, res) => {
    res.send('User')
})


router.route('/services').get([verifyUser], getServices);

router.route('/orders').get([verifyUser], getUserOrders);

router.route('/orders').post([verifyUser], addUserOrder);

router.route('/profile/:id').get([verifyUser], getUser);

router.route('/profile/update').put([verifyUser], updateUser);

router.route('/profile/coupon/:code').get([verifyUser], verifyCoupen);

/**
 * list out services
 * list out orders and make order know the status of particular order
 * get his profile
 */

module.exports = router;