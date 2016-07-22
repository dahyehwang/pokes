from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        self.load_model('User')
        self.load_model('Poke')
        self.db = self._app.db
   
    def index(self):
        return self.load_view('index.html')

    def user_info(self):
        data = {
        'name': request.form['name'],
        'alias': request.form['alias'],
        'email': request.form['email'],
        'password': request.form['password'],
        'confirm_pw': request.form['confirm_pw'],
        'date_of_birth': request.form['date_of_birth']
        }
        create_status = self.models['User'].add_user(data)
        if create_status['status'] == False:
            for message in create_status['errors']:
                flash(message)
            return redirect('/')
        else:
            flash('Successfully registered! Please login.')
            return redirect('/')

    def login(self):
        data = {
        'email': request.form['email'],
        'password': request.form['password']
        }
        user = self.models['User'].validate_user(data)
        if user:
            session['name'] = user[0]['name']
            return redirect('/pokes')
        else:
            flash('Email or password is not correct. Try again!')
            return redirect('/')

    def pokes(self):
        if 'poke' in session:
            pass
        else:
            session['poke'] = 0
            session['result'] = None
        data = self.models['Poke'].people()
        return self.load_view('pokes.html', data=data)

    def poke_submit(self, id):
        if request.form['poke'] == 'poke':
            session['poke'] += 1
        data = {
        'poke': session['poke']
        }
        print data
        poke = self.models['Poke'].poke_submit(data, id)
        return redirect('/pokes')


    def logout(self):
        session.clear()
        return redirect('/')
