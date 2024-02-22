const express = require('express');
const { verifyStaff } = require('../../middleware/middleware')

const {
    addService, getServices, updateService, deleteService
} = require('../../controller/Staff/serviceController')
const router = express.Router();


router.route('/').get([verifyStaff], getServices);


router.route('/add').post([verifyStaff], addService);

router.route('/update').put([verifyStaff], updateService);

router.route('/delete/:id').delete([verifyStaff], deleteService)


module.exports = router;