const express = require('express');
const { verifyStaff } = require('../../middleware/middleware')

const {
    getOrders, updateOrder
} = require('../../controller/Staff/orderController')

const router = express.Router();


router.route('/').get([verifyStaff], getOrders);
router.route('/update').put([verifyStaff], updateOrder);


module.exports = router;