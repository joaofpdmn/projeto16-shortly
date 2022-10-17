import express from 'express';
import { loginAccount, signUpAccount } from '../controllers/auth.controller.js';
import { showRanking } from '../controllers/ranking.controller.js';
import { getUrlsById, openShortUrl } from '../controllers/urls.controller.js';
import { getShortUrlByIdAuth, openShortUrlAuth } from '../middlewares/urls.middleware.js';

const authRouter = express.Router();

authRouter.post('/signup', signUpAccount);
authRouter.post('/signin', loginAccount);
authRouter.get('/ranking', showRanking);
authRouter.get('/urls/:id', getShortUrlByIdAuth, getUrlsById);
authRouter.get('/urls/open/:shortUrl', openShortUrlAuth, openShortUrl);

export { authRouter };