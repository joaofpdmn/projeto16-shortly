import connection from "../database/db";

async function userAuth(req, res, next){
    const { authorization } = req.headers;
    const token = authorization?.replace('Bearer ', '');
    if(!token) return res.status(401).send('Problema com token!');
    //procurar token em db.sessions
    //if !session = return usuário não está logado
    //achar user => res.locals.user = user;
    //if (!user) return status 401
    next();
}

export { userAuth };