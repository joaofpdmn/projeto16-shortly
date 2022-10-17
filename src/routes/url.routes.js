import express from 'express';
import { deleteUrl, shortenUrl } from '../controllers/urls.controller.js';
import { userAuth } from '../middlewares/auth.middleware.js';

const urlsRouter = express.Router();
const urlsNoAuthRouter = express.Router();

urlsRouter.use(userAuth);

urlsRouter.post('/urls/shorten', shortenUrl);
urlsRouter.delete('/urls/:id', deleteUrl);

export { urlsRouter, urlsNoAuthRouter };