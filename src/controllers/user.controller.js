import connection from "../database/db.js";

async function showProfile(req, res){
    try {
        const userId = res.locals.userId;
        const userValidation = await connection.query(`SELECT * FROM users WHERE id = '${userId}'`);
        if(!userValidation){
            return res.sendStatus(404);
        }
        const urlArray = (await connection.query(
            'SELECT id, shorturl, url, visitcount FROM urls WHERE userid = $1;',
            [userId]
        )).rows;
        const body = {
            id: userId,
            name: userValidation.rows[0].name,
            visitCount: 0,
            shortenedUrls: [],
        }
        urlArray.forEach(el => {
            body.visitCount += el.visitcount;
            body.shortenedUrls.push({
                id: el.id,
                shortUrl: el.shorturl,
                url: el.url,
                visitCount: el.visitcount,
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