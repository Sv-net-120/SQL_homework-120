--количество исполнителей в каждом жанре
select  g.genre_name "Жанр", count(s.singerid ) 
from singers s 
join singers_genres sg on s.singerID = sg.singer_id
join genres g  on sg.genre_id = g.genreid
group by g.genreid
order by g.genreid

--количество треков, вошедших в альбомы 2019-2020
select a.albumid , a.album_name, count(s.songid)
from albums a  
join Songs s on s.album_id  = a.albumid 
group by a.albumid 
order by a.albumid

--средняя продолжительность треков по каждому альбому

select a.albumid, a.album_name, avg(s.duration)
from albums a 
join songs s on a.albumid = s.album_id
group by a.albumid, a.album_name
order by a.albumid 

--все исполнители, которые не выпустили альбомы в 2020 году
select distinct s. singerid, concat(s.first_name,'  ', s.last_name) 
from singers s 
join Albums_Singers asi on s.singerid = asi.singer_id 
join albums a  on asi.album_id = a.albumid
where a.production != 2020
group by s. singerid, a.production
order by s.singerid 

--название сборников в которых исполнитель Lesley Roy
select sb.sbornik_name, s.singerid, concat(s.first_name, ' ',s.last_name)
from sborniks sb 
join songs_sborniks ss on sb.sbornikid = ss.sbornik_id
join songs s2 on ss.song_id = s2.songid 
join albums a on s2.album_id = a.albumid
join albums_singers as2 on s2.album_id = as2.album_id
join singers s on as2.singer_id = s.singerid
where s.first_name like 'Lesley' and s.last_name like 'Roy'
group by sb.sbornik_name, s.singerid
order by sb.sbornik_name

