import connection from "../database/db.js";
import { nanoid } from 'nanoid';

async function shortenUrl(req, res) {
    const { url } = req.body;
    const shortUrl = nanoid(8);
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
            ("url", "shortUrl", "userId")  
            VALUES
            ($1, $2, $3);`,
            [url, shortUrl, userId]
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

async function deleteUrl(req, res){
    const { id } = req.params;
    const { userId } = res.locals; 
    try {
        const urlValidation = await connection.query(`
        SELECT id FROM urls WHERE id = $1;`, [id]);
        if(!urlValidation){
            return res.sendStatus(404);
        }
        const url = await connection.query(`SELECT id FROM urls WHERE id = $1 AND "userId" = $2`, [id, userId]);
        if(!url){ return res.sendStatus(401)}
        await connection.query(`DELETE FROM urls WHERE id = $1`, [id]);
        return res.sendStatus(204);
        
    } catch (error) {
        return res.sendStatus(500);        
    }
}


export {
    shortenUrl,
    getUrlsById,
    openShortUrl,
    deleteUrl
}