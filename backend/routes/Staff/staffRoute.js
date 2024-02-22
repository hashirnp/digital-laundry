const express = require('express');
const router = express.Router();
const { verifyStaff } = require('../../middleware/middleware')
const serviceRouter = require('./serviceRouter')
const couponRouter = require('./couponRoute')
const orderRouter = require('./orderRouter')



router.route('/').get([verifyStaff], (req, res) => {
    res.status(200).send({ user: req.user })
});



router.use('/service', serviceRouter)

router.use('/coupon', couponRouter)

router.use('/orders', orderRouter)
/**
 * CRUD of Service - done
 * 
 * CRUD of Coupon - done
 * 
 * Order Proecessing (updating)
 * 
 */
module.exports = router;