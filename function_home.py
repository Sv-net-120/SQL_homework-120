
import psycopg2
from psycopg2 import Error

# создаем соединение
def create_conn_curs(name, user, password):
    try:
        conn = psycopg2.connect(database=name, user=user, password=password)
        conn.cursor()
        return conn
    except (Exception) as err:
        print( f' {name}, {user}, {password} - некорректный запрос на соединение с БД')

# создаем базу данных клиентов:
# таблица клиентов, таблица телефонов клиентов
def create_base(cur):
    cur.execute("""
        drop table tel_numbers
        """)
    cur.execute("""
        drop table clients
        """)
    cur.execute("""
            create table if not exists clients (
            clientID serial primary key,
            first_name varchar(30) not null ,
            last_name varchar(30) not null,
            e_mail varchar(30) not null)
                    """)
    cur.execute("""
            create table if not exists tel_numbers(
            telID serial PRIMARY KEY, 
            client_id integer NOT NULL 
            references clients(clientID) on delete cascade,
            tel_number varchar(30))
                    """)

# добавляем нового клиента
def insert_new_client(cursor,spisok):
    for element in spisok:
        for i in element:
            record_insert = (element[0], element[1], element[2])
            insert_query = """insert into clients(first_name, last_name, e_mail) 
        values(%s, %s, %s)"""
        cur.execute(insert_query, record_insert)
    # cur.execute("""select * from clients""")
    # print(cur.fetchall())

# добавляем новый телефон
def insert_new_telefon(cursor, spisok):
    for element in spisok:
        for i in element:
            record_insert = (element[0], element[1])
            insert_query = """insert into tel_numbers(client_id, tel_number) 
                values(%s, %s)"""
        cur.execute(insert_query, record_insert)
    # cur.execute("""select * from tel_numbers""")
    # print(cur.fetchall())

# изменяем данные о клиенте
def update_clients(cursor,ID, atribut, date_new):
    try:
        j = 0
        for i in atribut:
            update_query = f''' update clients set {i} = %s
                        where clientID = %s '''
            record_update = (date_new[j], ID)
            j +=1
            cur.execute(update_query, record_update)
        # cur.execute("""select * from clients""")
        # print(cur.fetchall())
    except (Exception) as err:
        conn.rollback()
        print( f'Некорректный запрос')

# удаляем телефон
def delete_telefon(cursor, ID):
    cur.execute("""
        DELETE FROM tel_numbers
        WHERE client_id = %s """, (ID,))
    # cur.execute("""
    #     SELECT * FROM tel_numbers""")
    # print(cur.fetchall())

#  удаляем клиента
def delete_client(cursor, ID):
    cur.execute("""
            DELETE FROM tel_numbers
            WHERE client_id = %s """, (ID,))
    cur.execute("""
                DELETE FROM clients
                WHERE clientID = %s """, (ID,))
    # cur.execute("""
    #             SELECT * FROM clients """)
    # print(cur.fetchall())

# ищем клиента по атрибутам
def find_client(cursor, atribut, atribut_date):
    try:
        select_query = f'''
            select concat(c.first_name,' ', c.last_name), c.e_mail, t.tel_number
            from clients c
            left join tel_numbers t on c.clientID = t.client_id 
            where {atribut} = %s  '''
        cur.execute(select_query,(atribut_date,))
    except (Exception) as err:
        conn.rollback()
        print(f'Некорректный запрос')

conn = create_conn_curs("Clients_db", "postgres", password= "151159")
# with psycopg2.connect(database = "Clients_db", user="postgres", password= "151159") as conn:
if conn:
    cur = conn.cursor()
    create_base(cur)
    insert_new_client(cursor=cur, spisok = [('Иван','Иванов','ivanov@mail.ru'),
                                            ('Петр', 'Петров', 'petrov @ mail.ru')])
    insert_new_telefon(cursor=cur, spisok = [(1, '89261002004'),
                                             (1, '89261002005')])
    update_clients(cursor=cur, ID = 1, atribut = ['rst_name','e_mail'], date_new = ['Дмитрий', 'evgeniy@yandex.ru'])
    delete_telefon(cursor=cur, ID=3)
    delete_client(cursor=cur, ID=3)
    find_client(cursor=cur, atribut ='el_number', atribut_date = '89261002025')

    conn.commit()

    cur.close()
    conn.close()