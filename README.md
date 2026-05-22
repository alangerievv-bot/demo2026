
первым делом активировать venv:
```
python -m venv venv
```
потом
```
.\venv\Scripts\activate
```
скачать приколы из requirements:
```
pip install -r .\requirements.txt
```
после этого осталось подкрутить бд. В pgadmin создать новую базу данных

<img width="903" height="591" alt="image" src="https://github.com/user-attachments/assets/b1457e92-2394-415a-8114-dc4d2fc881b6" />

после тыкнуть на нее и выбрать квери тул

<img width="488" height="703" alt="image" src="https://github.com/user-attachments/assets/64ce5ede-9e9e-4cf3-8a93-8b0738bd42d6" />

потом выбрать script.db (где-то в репе лежит) через эту кнопку

<img width="1252" height="548" alt="image" src="https://github.com/user-attachments/assets/974a42f5-15e8-4cf6-a1cc-af160c582ec2" />

И выполнить

<img width="1059" height="431" alt="image" src="https://github.com/user-attachments/assets/e9219a7b-4aca-4417-94d5-4bd2c40cb0a6" />

в выводе должно быть чето типо такого:
```
ALTER TABLE

Query returned successfully in 121 msec.
```
Далее вернуться в django и найти settings.py. Там найти бд:

<img width="1116" height="301" alt="image" src="https://github.com/user-attachments/assets/67a6b9e9-8991-4e82-8b80-0edf7e323dc1" />

```
DATABASES = { #важна
  'default': {
  'ENGINE': 'django.db.backends.postgresql',
  'NAME': '123', # сюда вставить название бд из pgadmin
  'USER': 'postgres', # название сервера, скорее всего postgres (смотря что выбирал)
  'PASSWORD': '', # пароль, который вводился при первой установки сервера в pgadmin
  'HOST': 'localhost',
  'PORT': '5432'
  }  
}
```


Если все правильно вставил, то после ввода этой команды ошибок быть не должно 
```
python.exe .\manage.py migrate
```
и теперь можно запустить 
```
python .\manage.py runserver 
```

логин и пароль для тестового пользователя:
```
kondratieva@cake-shop.ru
AdCk76#
```
