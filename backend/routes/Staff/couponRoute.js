const express = require('express');
const { verifyStaff } = require('../../middleware/middleware')

const {
    addCoupon, getCoupons, updateCoupon, deleteCoupon
} = require('../../controller/Staff/couponController')
const router = express.Router();


router.route('/').get([verifyStaff], getCoupons);


router.route('/add').post([verifyStaff], addCoupon);

router.route('/update').put([verifyStaff], updateCoupon);

router.route('/delete/:id').delete([verifyStaff], deleteCoupon)


module.exports = router;