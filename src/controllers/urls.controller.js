import connection from "../database/db";
import { nanoid } from 'nanoid';

async function shortenUrl(req, res) {
    const { url } = req.body;
    const shortUrl = nanoid(10);
    const userId = res.locals.userId;
    const isValidUrl = urlString => {
        try {
            return Boolean(new URL(urlString));
        }
        catch (e) {
            return false;
        }
    }
    const valid = isValidUrl(url);
    if (!valid) {
        return sendStatus(422);
    }
    try {
        await connection.query(`
            INSERT INTO urls
            ("userId", "originalUrl", "shortUrl")  
            VALUES
            ($1, $2, $3);`,
            [userId, url, shortUrl]
        );
        res.status(201).send(shortUrl);
    } catch (error) {
        return error;
    }
}

async function getUrlsById(req, res){
    const { userId, url, shortUrl } = res.locals.urlObject;
    res.send({ userId, shortUrl, url });
    return;
}

async function openShortUrl(req, res){
    const { userId, url} = res.locals.url;
    try {
        await connection.query(`INSERT INTO access ("accessId") VALUES ($1)`, [userId]);
        res.redirect(url);
    } catch (error) {
        return res.sendStatus(500);
    }
}


export {
    shortenUrl,
    getUrlsById,
    openShortUrl
}