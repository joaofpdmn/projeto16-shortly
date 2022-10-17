import connection from "../database/db.js";

async function showProfile(req, res){
    try {
        const userId = res.locals.userId;
        const userValidation = await connection.query(`SELECT name FROM users WHERE id = '${userId}'`);
        if(!userValidation){
            return res.sendStatus(404);
        }
        const url = await connection.query('SELECT id, "shortUrl", url, "visitCount" FROM urls WHERE "userId" = $1;',
        [userId]);
        const body = {
            id: userId,
            name: userValidation[0].name,
            visitCount: 0,
            shortenedUrls: [],
        }
        url.map(el => {
            body.visitCount += url.visitCount;
            body.shortenedUrls.push({
                id: el.id,
                shortUrl: el.shortUrl,
                url: el.url,
                visitCount: el.visitCount,
            });
        })
        return res.status(200).send(body);
    } catch (error) {
        return res.sendStatus(500);
    }
}

export {
    showProfile,
    
}