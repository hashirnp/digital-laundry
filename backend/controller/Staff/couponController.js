const Coupon = require('../../models/Coupon.js');
const { sendResponseError } = require('../../middleware/middleware.js')
ObjectID = require('mongodb').ObjectID;

const getCoupons = async (req, res) => {
    try {
        const Coupons = await Coupon.find({})
        console.log(Coupons)
        res.status(200).json({ status: 'ok', data: Coupons })
    } catch (err) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

const addCoupon = async (req, res) => {
    const { id, description, price, processingTime, imageUrl } = req.body
    try {
        const newCoupon = await Coupon.create({ ...req.body })


        res.status(201).json({
            statusCode: 201,
            message: 'Coupon Added',

            Coupon: {
                code: newCoupon.code,
                discount: newCoupon.discount,
                expirationDate: newCoupon.expirationDate,
                usageLimit: newCoupon.usageLimit,
                active: newCoupon.active
            }

            // Include token if generated (use proper security considerations)
        });


        // res.status(201).josn({ status: 'ok', Coupon: newCoupon })
    } catch (err) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

const updateCoupon = async (req, res) => {

    console.log(req.body._id);

    try {
        await Coupon.updateOne({ "_id": ObjectID(req.body._id) }, req.body, { upsert: false })
        res.status(200).json({ status: 'updated', data: req.body })
    } catch (e) {
        console.log(e)
        sendResponseError(500, `Error ${e}`, res)
    }
}

const deleteCoupon = async (req, res) => {
    console.log("Callled ");
    try {
        await Coupon.findByIdAndRemove(req.params.id)
        res.status(200).send({ status: 'ok' })
    } catch (e) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

module.exports = { addCoupon, getCoupons, updateCoupon, deleteCoupon }
