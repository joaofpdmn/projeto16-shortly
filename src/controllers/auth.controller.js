import bcrypt from 'bcrypt';
import Joi from 'joi';
import connection from '../database/db';
import { v4 as uuid } from 'uuid';

async function signUpAccount(req, res){
    const { name, email, password, confirmPassword } = req.body;
    try {
        //checar se tem o mesmo email no db
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
        //adicionar a conta ao DB
    } catch (error) {
        res.sendStatus(422);
    }
    res.sendStatus(201);
}

async function loginAccount(req, res){
    const { email, password } = req.body;
    try {
        //checar se email esta no db ou nao /** if !user || !bcrypt.compareSync*/
        const token = uuid();
        //inserir token e email no db das sessoes
    } catch (error) {
        return sendStatus(401);
    }
    return sendStatus(200);
}

export { signUpAccount, loginAccount };
