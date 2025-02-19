
create table if not exists Singers(
	singerID serial primary key,
	first_name varchar(30) not null,
	last_name varchar(60) not null
	)
create table if not exists Genres(
	genreID serial primary key,
	genre_name varchar(60) not null
	)
create table if not exists Singers_Genres(
	singer_id int references Singers,
	genre_id int references Genres,
	primary key(singer_id, genre_id)	
	)
	
create table if not exists Albums(
	albumID serial primary key,
	album_name varchar(60),
	production int not null,
	check(production <= extract(year from current_date))
	)
	
create table if not exists Albums_Singers(
	album_id int references Albums(albumID),
	singer_id int references Singers(singerID),
	primary key(album_id, singer_id)
	)
	
create table if not exists Sborniks(
	sbornikID serial primary key,
	sbornik_name varchar(60) not null,
	year_release int not null,
	check(year_release <= extract(year from current_date))
	)
	
create table if not exists Songs(
	songID serial primary key,
	song_name varchar(60) not null,
	duration time not null,
	album_id int references Albums(albumID)
	)
	
create table if not exists Songs_Sborniks(
	song_id int references Songs(songID),
	sbornik_id int references Sborniks(sbornikID),
	primary key(song_id, sbornik_id)
	)

	