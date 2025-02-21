 Домашняя работа "Работа с SQL. Создание БД":

1. Фаил music.png содержит схему музыкального сайта 
2. Фаил music.sql содержит код postresql 


 
19.02 в репозиторий добавлены два файла 
 music_2.png исправленная схема
 music_2.sql исправленный код

   
В работе учтены замечания эксперта 

21.02  в репозиторий добавлены три файла
cINSERT.sql - Задание 1
cSELECT.sql - Задание 2
cCREATE.sql - Задание 3
   
в таблице треков, предварительно изменен тип атрибута duration 

alter table songs 
drop column duration

alter table songs 
add duration decimal(6,2)
