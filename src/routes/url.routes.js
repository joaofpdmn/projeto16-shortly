import express from 'express';
import { showRanking } from '../controllers/ranking.controller.js';
import { deleteUrl, getUrlsById, openShortUrl, shortenUrl } from '../controllers/urls.controller.js';
import { userAuth } from '../middlewares/auth.middleware.js';
import { getShortUrlByIdAuth, openShortUrlAuth } from '../middlewares/urls.middleware.js';

const urlsRouter = express.Router();
const urlsNoAuthRouter = express.Router();

urlsRouter.use(userAuth);

urlsRouter.post('/urls/shorten', shortenUrl);
urlsNoAuthRouter.get('/urls/:id', getShortUrlByIdAuth, getUrlsById);
urlsNoAuthRouter.get('/urls/open/:shortUrl', openShortUrlAuth, openShortUrl);
urlsRouter.delete('/urls/:id', deleteUrl);
urlsNoAuthRouter.get('/ranking', showRanking);

export { urlsRouter, urlsNoAuthRouter };