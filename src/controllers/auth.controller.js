import bcrypt from 'bcrypt';
import Joi from 'joi';
import connection from '../database/db.js';
import { v4 as uuid } from 'uuid';

async function signUpAccount(req, res){
    const { name, email, password, confirmPassword } = req.body;
    try {
        //checar se tem o mesmo email no db
        const signUpQuery = await connection.query(`SELECT * FROM users WHERE email = '${email}'`);
        if(signUpQuery.rows.length>0){
            return res.status(409).send('Email já cadastrado!');
        }
        if(password !== confirmPassword){
            return res.status(422).send('Repetição de password falhou!');
        }
        const passwordHash = bcrypt.hashSync(password, 10);
        const schema = Joi.object({
            name: Joi.string().min(1).required().trim(),
            email: Joi.string().min(1).required().trim(),
            password: Joi.string().min(1).required().trim(),
        });
        const validate = await schema.validateAsync({ name, email, password });
        await connection.query(
            'INSERT INTO users (name, email, password) VALUES ($1, $2, $3);',
            [name, email, passwordHash]
        );
        //adicionar a conta ao DB
        //teste
    } catch (error) {
        res.sendStatus(422);
    }
    res.sendStatus(201);
}

async function loginAccount(req, res){
    const { email, password } = req.body;
    try {
        const loginQuery = await connection.query(`SELECT * FROM users WHERE email = '${email}'`);
        //checar se email esta no db ou nao /** if !user || !bcrypt.compareSync*/
        if(!loginQuery.rows.length || !bcrypt.compareSync(password, loginQuery.rows[0].password)){
            return sendStatus(401);
        }
        const token = uuid();
        const userId = loginQuery.rows[0].userId;
        //inserir token e email no db das sessoes
        await connection.query(`INSERT INTO sessions (userId, token) VALUES ($1, $2)`, [userId, token]);
        return res.status(200).send(token);
    } catch (error) {
        return sendStatus(500);
    }   
}

export { signUpAccount, loginAccount };
