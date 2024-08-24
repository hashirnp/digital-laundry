const Order = require('../../models/Order.js');
const User = require('../../models/User.js');
const { sendResponseError } = require('../../middleware/middleware.js')
ObjectID = require('mongodb').ObjectID;
const { sendMessege } = require('../Twilio/twilioController.js')

const getOrders = async (req, res) => {
    try {
        const Orders = await Order.find({})
        console.log(Orders)
        res.status(200).json({ status: 'ok', data: Orders })
    } catch (err) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

const updateOrder = async (req, res) => {

    console.log(req.body._id);

    try {
        await Order.updateOne({ "_id": ObjectID(req.body._id) }, req.body)
        var msg = `Your Order ${req.body._id} is ${req.body.status}`+"\n\nDigital Laundry Ltd";

        var user = await User.findById({ _id: ObjectID(req.body.userId) });
        // console.log(msg);
        // console.log(user.phone);
        //prepare msg and send
        await sendMessege(user.phone, msg)
        
        res.status(201).json({ status: 'updated', data: req.body, })

        


    } catch (e) {
        console.log(e)
        sendResponseError(500, `Error ${e}`, res)
    }
}

module.exports = { getOrders, updateOrder }
