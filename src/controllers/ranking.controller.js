import connection from "../database/db.js";

async function showRanking(req, res) {
    try {
        
        return res.status(200).send("ranking");
    } catch (error) {
        return res.sendStatus(500);
    }
}

export { showRanking }; 