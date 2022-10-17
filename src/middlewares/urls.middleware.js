import connection from "../database/db.js";

async function getShortUrlByIdAuth(req, res, next){
    const { id } = req.params;
    try {
        const idValidation = await connection.query(`
            SELECT * FROM urls
            WHERE id = $1;`,
            [id]
        );
        if(!idValidation){
            return res.status(404).send('ID not found!');
        }
        res.locals.urlObject = idValidation.rows[0];
    } catch (error) {
        return res.sendStatus(500);
    }
    next();
}

async function openShortUrlAuth(req, res, next){
    const { shortUrl } = req.params;
    try {
        const urlValidation = await connection.query(`SELECT * FROM urls WHERE shorturl = $1`, [shortUrl]);
        if(!urlValidation){
            return res.status(404).send('Url não encontrada!');
        }
        res.locals.urlObj = urlValidation.rows[0];
    } catch (error) {
        return res.sendStatus(500);
    }
    next();
}

export {
    getShortUrlByIdAuth,
    openShortUrlAuth
};