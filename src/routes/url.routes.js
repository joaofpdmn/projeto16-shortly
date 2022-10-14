import express from 'express';
import { getUrlsById, openShortUrl, shortenUrl } from '../controllers/urls.controller';
import { userAuth } from '../middlewares/auth.middleware';
import { getShortUrlByIdAuth, openShortUrlAuth } from '../middlewares/urls.middleware';

const urlsRouter = express.Router();
const urlsNoAuthRouter = express.Router();

urlsRouter.use(userAuth);

urlsRouter.post('/urls/shorten', shortenUrl);
urlsNoAuthRouter.get('/urls/:id', getShortUrlByIdAuth, getUrlsById);
urlsNoAuthRouter.get('/urls/open/:shortUrl', openShortUrlAuth, openShortUrl);

export { urlsRouter, urlsNoAuthRouter };