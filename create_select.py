import json
from tkinter.tix import Select

import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from home_models import create_tables, Publisher, Book, Sale, Shop, Stock

DSN = ('postgresql://postgres:151159@localhost:5432/postgres')
engine = sq.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()


with open('tests_data.json', 'r', encoding='utf-8') as fd:
    data = json.load(fd)

for record in data:
    model = {
        'publisher': Publisher,
        'book': Book,
        'shop': Shop,
        'stock': Stock,
        'sale': Sale
    }[record.get('model')]
    session.add(model(id=record.get('pk'), **record.get('fields')))

subq = session.query(Publisher).filter(Publisher.name.like('Microsoft Press')).subquery()
for b in session.query(Book).join(subq, Book.id_publisher == subq.c.id).all():
    print( f' {b.id_publisher} : {b.title}')

session.commit()

session.close()

