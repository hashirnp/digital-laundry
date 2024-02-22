
const User = require('../models/User')
const { verifyToken } = require('../utils/utility.function')

const sendResponseError = (statusCode, msg, res) => {
  res.status(statusCode || 400).send(!!msg ? msg : 'Invalid input !!')
}

const verifyUser = async (req, res, next) => {
  const { authorization } = req.headers
  if (!authorization) {
    sendResponseError(400, 'You are not authorized ', res)
    return
  } else if (!authorization.startsWith('Bearer ')) {
    sendResponseError(400, 'You are not authorized ', res)
    return
  }

  try {
    const payload = await verifyToken(authorization.split(' ')[1])
    if (payload) {
      const user = await User.findById(payload.id, { password: 0 })
      
      if (user.role === "user") {
        req['user'] = user
        next();
      } else {
        sendResponseError(400, `you are not authorizeed to do this action you are Staff`, res)
      }
    } else {
      sendResponseError(400, `you are not authorizeed`, res)
    }
  } catch (err) {
    console.log('Error ', err)
    sendResponseError(400, `Error ${err}`, res)
  }
}


const verifyStaff = async (req, res, next) => {
  const { authorization } = req.headers
  if (!authorization) {
    sendResponseError(400, 'You are not authorized ', res)
    return
  } else if (!authorization.startsWith('Bearer ')) {
    sendResponseError(400, 'You are not authorized ', res)
    return
  }

  try {
    const payload = await verifyToken(authorization.split(' ')[1])
    if (payload) {
      const user = await User.findById(payload.id, { password: 0 })
      if (user.role === "staff") {
        req['user'] = user
        next();
      } else {
        sendResponseError(400, `you are not authorizeed to do this action you are user`, res)
      }
      // next()
    } else {
      sendResponseError(400, `you are not authorizeed`, res)
    }
  } catch (err) {
    console.log('Error ', err)
    sendResponseError(400, `Error ${err}`, res)
  }
}

module.exports = {
  sendResponseError,
  verifyUser,
  verifyStaff,
}
