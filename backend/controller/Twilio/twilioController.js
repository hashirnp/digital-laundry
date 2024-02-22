const accountSid = 'ACb6409c2f86f3f3ad109c9c43b64f1dfa';
const authToken = process.env.TWILIO_TOKEN;
const client = require('twilio')(accountSid, authToken);

const sendMessege = async (number, messege) => {
    client.messages
        .create({
            body: messege,
            from: '+12093306664',
            to: "+91" + number,
        })
        .then(message => console.log(message.sid))
    // .done();
}

module.exports = { sendMessege }