import express from 'express';
import cors from 'cors';
const app = express();
app.use(cors());
app.use(express.json());

app.get('/', (req, res, next) => {
    res.status(200).json({
        status: 'success'
    });
});

app.listen(process.env.PORT, () => {
    console.log("Server running on port " + process.env.PORT);
});