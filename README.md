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

22.02
учтено замечание эксперта в ЗАДАНИИ 2 фаил cSELECT.sql
Создан вложенный цикл для поиска  максимального по продолжительности трека
код проверен

ЗАДАНИЕ 3 находится в репозиторbb в файле cCREATE.sql 
(запросы с использованием join) такое название файла указано в рекомендациях
к дом. заданию

26/02 в репозиторий добавлен фаил function_home.py
ЗАДАНИЕ к лекции Работа с PostgreSQL из Python

03.03 добавлены файлы с кодами к теме Python БД ORM
 home_models.py
 create_select.py
