import express from 'express';
import { userAuth } from '../middlewares/auth.middleware';

const urlsRouter = express.Router();

urlsRouter.use(userAuth);


export { urlsRouter };