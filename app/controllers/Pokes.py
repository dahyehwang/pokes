from system.core.controller import *

class Pokes(Controller):
    def __init__(self, action):
        super(Pokes, self).__init__(action)
        self.load_model('Poke')
        self.db = self._app.db
   
    def index(self):
        return self.load_view('pokes.html')

    