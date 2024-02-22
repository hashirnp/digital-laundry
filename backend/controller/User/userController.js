const Service = require('../../models/service.js');
const Order = require('../../models/Order.js')
const User = require('../../models/User.js')
const Coupon = require('../../models/Coupon.js')
const { sendResponseError } = require('../../middleware/middleware')
ObjectID = require('mongodb').ObjectID;


//get service
const getServices = async (req, res) => {
    try {
        const services = await Service.find({})
        console.log(services)
        res.status(200).json({ status: 'ok', data: services })
    } catch (err) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

const getUserOrders = async (req, res) => {
    try {
        const orders = await Order.find({ userId: req.user._id }).populate('serviceId').populate('coupon').populate('userId')
        // console.log(carts)
        res.status(200).json({ status: 'ok', data: orders })
    } catch (err) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}


const addUserOrder = async (req, res) => {
    try {
        const newOrder = await Order.create({ ...req.body })
        // console.log(newOrder);
        const userID = req.body.userId;
        //update user order

        const addNewOrder = await User.updateOne({ _id: ObjectID(userID) }, { $push: { orders: newOrder._id } })
        console.log(addNewOrder);
        res.status(200).json({ status: 'ok', data: newOrder })
    } catch (err) {
        console.log(err);
        sendResponseError(500, `Error ${err}`, res)
    }
}

const getUser = async (req, res) => {
    try {
        const user = await User.findOne({ _id: ObjectID(req.params.id) })

        res.status(200).json({ status: "ok", data: user });

    } catch (err) {
        console.log("errorrrrrrrrrrrrrrrrr" + err);
        sendResponseError(500, `Error ${err}`, res)
    }
}

const updateUser = async (req, res) => {

    console.log(req.body._id);

    try {
        await User.updateOne({ "_id": ObjectID(req.body._id) }, req.body)
        res.status(201).json({ status: 'updated', data: req.body, })
    } catch (e) {
        console.log(e)
        sendResponseError(500, `Error ${e}`, res)
    }
}

const verifyCoupen = async (req, res) => {
    try {
        const coupon = await Coupon.findOne({ code: req.params.code })
        if (coupon === null) {
            res.status(201).json({ status: false, messege: "not available" })
        } else {
            var expireTime = new Date(coupon.expirationDate);
            const currentTime = new Date();

            if (expireTime < currentTime) {
                res.status(201).json({ status: false, messege: 'expired' })

            } else if (expireTime >= currentTime) {
                res.status(201).json({ status: true, messege: 'ok', coupon: coupon }) 
            }
        }
    } catch (err) {
        console.log(err);
        sendResponseError(500, `Error ${err}`, res)
    }
}

module.exports = { getServices, getUserOrders, addUserOrder, getUser, updateUser, verifyCoupen }

