import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { authRouter } from './routes/auth.routes';
import { urlsNoAuthRouter, urlsRouter } from './routes/url.routes';
import { userRouter } from './routes/user.routes';
const app = express();
app.use(cors());
app.use(express.json());
dotenv.config();

app.get('/', (req, res, next) => {
    res.status(200).json({
        status: 'success'
    });
});

app.use(authRouter);
app.use(urlsRouter);
app.use(urlsNoAuthRouter);
app.use(userRouter);

app.listen(process.env.PORT, () => {
    console.log("Server running on port " + process.env.PORT);
});