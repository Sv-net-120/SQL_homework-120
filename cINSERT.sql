
insert into Singers(first_name, last_name) values 
	('Teezo', 'Touchdown'),
	('Lesley','Roy'),
	('Jenna', 'Doe'),
	('Sam', 'Half'),
	('Alex', 'Band')

insert  into Genres(genre_name) values 
	('Pop'), ('Rok'), ('Dance')

insert into Singers_Genres(singer_id, genre_id ) values 
	(1,1),(1,2),(1,3),
	(2,2),(2,3),
	(3,1),
	(4,3),
	(5,2),(5,3)

insert into Albums(album_name, production) values 
	('APT', 2019),
	('Petals to Thorns', 2018),
	('Krystal', 2020),
	('Twilight', 2021),
	('My heart', 2023)

insert into Albums_Singers(album_id, singer_id ) values 
	(1,1),(1,2),(1,3),(1,5),
	(2,2),(2,3),(2,4),
	(3,1),(3,2), (3,5),
	(4,3), (4,4), (4,5),
	(5,2),(5,3),(5,5)

insert into Sborniks(sbornik_name, year_release) values 
	('Greatest Hits', 2019),
	('When facing the things', 2021),
	('Unheard', 2024),
	('Goodby Lullady', 2020)

insert into Songs (song_name, duration, album_id) values 
	('I kiss a girl', 3.55, 1),
	('Sparks', 2.45, 2),
	('How to save a life', 3.58, 3),
	('As I was', 3.30, 4),
	('Good Luck, Baby', 2.20,4),
	('Dance, dance', 3.48, 5),
	('Feel good', 3.10, 1)	

insert into Songs_Sborniks(song_id, sbornik_id) values 
	(1,1),(1,2),(1,4),
	(2,1),(2,2),(2,3),(2,4),
	(3,2), (3,4),
	(4,2),(4,3),(4,4),
	(5,1),(5,2),(5,3),(5,4),
	(6,1),(6,3), (6,4),
	(7,3), (7,4)
	
	
	


	