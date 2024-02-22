const Service = require('../../models/service.js');
const { sendResponseError } = require('../../middleware/middleware')
ObjectID = require('mongodb').ObjectID;

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

const addService = async (req, res) => {
    try {
        const newService = await Service.create({ ...req.body })


        res.status(201).json({
            statusCode: 201,
            message: 'Service Added',

            service: {
                name: newService.name,
                description: newService.description,
                price: newService.price,
                processingTime: newService.processingTime,
                imageUrl: newService.imageUrl
            }

            // Include token if generated (use proper security considerations)
        });


        // res.status(201).josn({ status: 'ok', service: newService })
    } catch (err) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

const updateService = async (req, res) => {

    console.log(req.body._id);

    try {
        await Service.updateOne({ "_id": ObjectID(req.body._id) }, req.body, { upsert: true })
        res.status(200).json({ status: 'updated', data: req.body })
    } catch (e) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

const deleteService = async (req, res) => {
    console.log("Callled ");
    try {
        await Service.findByIdAndRemove(req.params.id)
        res.status(200).send({ status: 'ok' })
    } catch (e) {
        console.log(err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

module.exports = { addService, getServices, updateService, deleteService }
