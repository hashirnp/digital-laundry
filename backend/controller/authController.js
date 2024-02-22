const express = require('express')
const bcrypt = require('bcrypt')
const User = require('../models/User')
const { sendResponseError } = require('../middleware/middleware')
const { checkPassword, newToken } = require('../utils/utility.function')


const signUpUser = async (req, res) => {
    const { email, fullName, password } = req.body

    try {
        const hash = await bcrypt.hash(password, 8)

        const newUser = await User.create({ ...req.body, password: hash })
        // res.status(201).send('Sucessfully account opened ')
        let token = newToken(newUser)

        res.status(201).json({
            statusCode: 201,
            message: 'Account successfully created!',
            token: token,
            user: { // Provide relevant user information, e.g.,
                id: newUser._id,
                email: newUser.email,
                fullName: newUser.fullName,
                phone: newUser.phone,
                address: newUser.address,
                role: newUser.role
                // Other fields as needed
            },
            // Include token if generated (use proper security considerations)
        });
        return
    } catch (err) {
        console.log('Eorror : ', err)
        sendResponseError(500, 'Something wrong please try again', res)
        return
    }
}

const signInUser = async (req, res) => {
    const { password, email } = req.body
    console.log(req.body)
    try {
        const user = await User.findOne({ email })
        if (!!!user) {
            sendResponseError(400, 'You have to Sign up first !', res)
        }

        const same = await checkPassword(password, user.password)
        if (same) {
            let token = newToken(user)
            // res.status(200).send({ status: 'ok', token })
            res.status(201).json({
                statusCode: 201,
                message: 'ok',
                token: token,
                user: { // Provide relevant user information, e.g.,
                    id: user._id,
                    email: user.email,
                    fullName: user.fullName,
                    phone: user.phone,
                    address: user.address,
                    role: user.role
                    // Other fields as needed
                },
                // Include token if generated (use proper security considerations)
            });
            return
        }
        sendResponseError(400, 'InValid password !', res)
    } catch (err) {
        console.log('EROR', err)
        sendResponseError(500, `Error ${err}`, res)
    }
}

const getUser = async (req, res) => {
    res.status(200).send({ user: req.user })
}
module.exports = { signUpUser, signInUser, getUser }
