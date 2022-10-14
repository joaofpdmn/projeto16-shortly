import connection from "../database/db";
import { nanoid } from 'nanoid';

async function shortenUrl(req, res) {
    //get userId 
    const { url } = req.body;
    const shortUrl = nanoid(10);
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




export {
    shortenUrl,

}