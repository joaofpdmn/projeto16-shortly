import express from 'express';
import { showProfile } from '../controllers/user.controller.js';
import { userAuth } from '../middlewares/auth.middleware.js';

const userRouter = express.Router();
userRouter.use(userAuth);

userRouter.get('/users/me', showProfile);


export { userRouter };