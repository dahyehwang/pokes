from system.core.model import Model


class Poke(Model):
    def __init__(self):
        super(Poke, self).__init__()

    def people(self):
        query = "SELECT * FROM users"
        return self.db.query_db(query)

    def poke(self):
    	query = "SELECT * FROM pokes JOIN users ON pokes.user_id = users.id"
    	return self.db.query_db(query)

    def poke_submit(self, poke, id):
        query = "UPDATE pokes SET poke= :poke, updated_at= NOW(), user_id WHERE id= :id"

        print 'here'
        data = {
        'poke': poke['poke'],
        'id':id
         }
        return self.db.query_db(query, data)
