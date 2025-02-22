-- название и продолжительность самого длинного трека
select song_name, duration
from Songs
where duration = (select max(duration) from songs)
group by song_name, duration
limit 1

---название треков, продолжительность которых не менее 3,5 минут
select song_name, duration
from songs  
where duration >= 3.5
group by song_name, duration

--названия сборников, вышедших в период с 2018 по 2020 год включительно
select sbornik_name, year_release
from sborniks  
where year_release >= 2018 and year_release <= 2020
group by sbornik_name, year_release
order by  year_release 

--названия треков, которые содержат слово 'my'
select song_name
from songs  
where song_name ilike '%my%'
