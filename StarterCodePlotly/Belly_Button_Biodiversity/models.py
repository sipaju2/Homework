from .app import db

class BellyButton(db.Model):
    __tablename__='BellyButtons'

        id = db.Column(db.Integer, primary_key=True)
        sample =db.Column(db.Integer)
        ETHNICITY = db.Column(db.String(25))
        GENDER= db.Column(db.string(2)
        AGE= db.Column(db.Integer)
        LOCATION = db.Column(db.string(50))
        BBTYPE= db.Column(db.Integer)
        WFREQ = db.Column(db.Integer)
    
    def __repr__(self):
        return '<BellyButton %r>' %(self.sample)
