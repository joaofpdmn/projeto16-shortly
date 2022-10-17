import connection from "../database/db.js";

async function showRanking(req, res) {
    try {
        const ranking = await connection.query(
            'SELECT users.id, users.name, COUNT(urls.id) AS "linksCount", COALESCE(SUM(urls.visitcount), 0) AS visitcount FROM users LEFT JOIN urls ON users.id = urls.userid GROUP BY users.id ORDER BY visitcount DESC, "linksCount" DESC LIMIT 10;'
        );
        return res.status(200).send(ranking);
    } catch (error) {
        return res.sendStatus(500);
    }
}

export { showRanking }; 