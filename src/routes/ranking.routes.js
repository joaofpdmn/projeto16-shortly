import express from 'express';
import { showRanking } from '../controllers/ranking.controller.js';

const rankingRouter = express.Router();

rankingRouter.get('/ranking', showRanking);

export { rankingRouter };