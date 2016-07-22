from system.core.model import Model
import re


class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def add_user(self, user):
        EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
        errors = []
        if not user['name']:
            errors.append('Name cannot be blank')
        if len(user['name']) < 2:
            errors.append('Name must be at least 2 characters long')
        if not user['alias']:
            errors.append('Alias cannot be blank')
        if len(user['alias']) < 2:
            errors.append('Alias must be at least 2 characters long')
        if not user['email']:
            errors.append('Email cannot be blank')
        if not EMAIL_REGEX.match(user['email']):
            errors.append('Email format must be valid!')
        if not user['password']:
            errors.append('Password cannot be blank')
        if len(user['password']) < 8:
            errors.append('Password must be at least 8 characters long')
        if user['password'] != user['confirm_pw']:
            errors.append('Password and confirmation must match!')
        if not user['date_of_birth']:
            errors.append('Date of birth cannot be blank')
        if errors:
            return {"status": False, "errors": errors}
        else:
            password = user['password']
            hashed_pw = self.bcrypt.generate_password_hash(password)
            query = "INSERT INTO users (name, alias, email, password, date_of_birth, created_at, updated_at) VALUES (:name, :alias, :email, :password, :date_of_birth, NOW(), NOW())"
            data = {
            'name': user['name'],
            'alias': user['alias'],
            'email': user['email'],
            'password': hashed_pw,
            'date_of_birth': user['date_of_birth']
            }
            self.db.query_db(query, data)
            return {"status": True}

    def validate_user(self, user):
        password = user['password']
        query = "SELECT * FROM users WHERE email = :temp_email"
        data = {'temp_email': user['email']}
        user = self.db.query_db(query, data)
        if not user:
            return False
        else:
            if self.bcrypt.check_password_hash(user[0]['password'], password):
                return user
            else:
                return False

    


    """
    Below is an example of a model method that queries the database for all users in a fictitious application
    
    Every model has access to the "self.db.query_db" method which allows you to interact with the database

    def get_users(self):
        query = "SELECT * from users"
        return self.db.query_db(query)

    def get_user(self):
        query = "SELECT * from users where id = :id"
        data = {'id': 1}
        return self.db.get_one(query, data)

    def add_message(self):
        sql = "INSERT into messages (message, created_at, users_id) values(:message, NOW(), :users_id)"
        data = {'message': 'awesome bro', 'users_id': 1}
        self.db.query_db(sql, data)
        return True
    
    def grab_messages(self):
        query = "SELECT * from messages where users_id = :user_id"
        data = {'user_id':1}
        return self.db.query_db(query, data)

    """