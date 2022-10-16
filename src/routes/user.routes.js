import express from 'express';
import { showProfile } from '../controllers/user.controller';
import { userAuth } from '../middlewares/auth.middleware';

const userRouter = express.Router();
userRouter.use(userAuth);

userRouter.get('/users/me', showProfile);


export { userRouter };