# Linux terminal (GitBash) commands
1) Посмотреть где я: 
   >pwd
2) Создать папку:
   >mkdir new_folder
3) Зайти в папку: 
   > cd new_folder
4) Создать 3 папки: 
   > mkdir folder_1 folder_2 folder_3
5) Зайти в любую папку: 
   > cd folder_1
6) Создать 5 файлов (3 txt, 2 json): 
   > touch file_1.txt file_2.txt file_3.txt file_4.json file_5.json
7) Создать 3 папки: 
   > mkdir inner_folder_1 inner_folder_2 inner_folder_3
8) Вывести список содержимого папки: 
   > ls -la
9) Открыть любой txt файл:
    >vim file_1.txt
10) написать туда что-нибудь, любой текст: `i` (insert) - чтоб начать печатать
11) сохранить и выйти: esc, `:wq`
12) Выйти из папки на уровень выше: 
    > cd ..
13) переместить любые 2 файла, которые вы создали, в любую другую папку: 
    > mv file_4.json file_5.json inner_folder_1
14) скопировать любые 2 файла, которые вы создали, в любую другую папку: 
    > cp file_1.txt file_2.txt inner_folder_2
15) Найти файл по имени: 
    > find . -name "file_1.txt"
16) просмотреть содержимое в реальном времени (команда grep) изучите как она работает:
    `grep` - команда для поиска текста и символов в файле, а для просмотра содержимого файла в реальном времени используется:
    > tail -f file_1.txt
17) вывести несколько первых строк из текстового файла: 
    > head -2 file_1.txt
18) вывести несколько последних строк из текстового файла: 
    > tail -2 file_1.txt
19) просмотреть содержимое длинного файла (команда less) изучите как она работает: 
    > less file_1.txt
20) вывести дату и время: 
    > date "+%H:%M:%S %d/%m/%y"
    
## Задание *
1) Отправить http запрос на сервер
   `http://162.55.220.72:5005/object_info_3?name=Vadim&age=32&salary=1000`
   > curl "http://162.55.220.72:5005/object_info_3?name=Vadim&age=32&salary=1000"
2) Написать скрипт который выполнит автоматически пункты 3, 4, 5, 6, 7, 8, 13
````
#!/bin/bash
mkdir new_folder
# Зайти в папку
cd new_folder
# Создать 3 папки
mkdir folder_1 folder_2 folder_3
# Зайти в любую папку
cd folder_1
# Создать 5 файлов (3 txt, 2 json)
touch file_1.txt file_2.txt file_3.txt file_4.json file_5.json
# Создать 3 папки
mkdir inner_folder_1 inner_folder_2 inner_folder_3
# Вывести список содержимого папки
echo "$(ls -la)"
# переместить любые 2 файла, которые вы создали, в любую другую папку
mv file_4.json file_5.json inner_folder_1
$SHELL
````

Запуск скрипта: `chmod +x script.sh`, `./script.sh`
