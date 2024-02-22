let PORT = process.env.PORT || 3000;


const express = require('express');
const { connectDB } = require("./config/db")
const staffRouter = require('./routes/Staff/staffRoute')
const userRouter = require('./routes/User/userRoute')
const authRouter = require('./routes/Auth/authRoutes');
const cors = require("cors");
const rateLimit = require('express-rate-limit');

connectDB();

const app = express();
app.use(express.json());
app.use(cors());

const limiter = rateLimit({
    windowMs: 10 * 60 * 1000,
    max: 100,
    handler: (req, res) => {
        res.status(429).json({
            code: 429,
            message: 'Too many requests from this IP, please try again later.'

        });
    },
});

app.use(limiter);


app.get('/', (req, res) => {
    res.send('Welcome to the digital_laundry API!');
});

app.post('/', (req, res) => {
    console.log(req.body);
    res.send('Welcome to the digital_laundry API!');
});


app.use('/api/user', userRouter);
app.use('/api/staff', staffRouter);
app.use('/api/auth', authRouter);

app.listen(PORT, () => {
    console.log("Server is running on PORT " + PORT);
})
