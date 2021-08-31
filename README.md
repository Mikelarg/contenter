# Contenter
## _Тестовое задание с контентом_


### Запуск

```sh
docker-compose up runserver
```
И направляйтесь сюда http://0.0.0.0:8000/api/

Данные для входа в админку:
* Username — root
* Password — qwerty

### Запуск тестов
```sh
docker-compose up autotests
```
### API
#### Получение списка страниц
Находится по /api/pages/

Доступные значения
```js
{
    "id": "id страницы",
    "title": "Заголовок страницы",
    "detail_url": "Ссылка на детальной api url"
}
```
#### Детальный просмотр страницы
Находится по /api/pages/<id страницы>/
Доступные значения
```js
{
    "id": "id страницы",
    "title": "Заголовок страницы",
    "contents": [
        "content": {} // Объект контента
    ]
}
```
#### Объекты контента
##### Видео
```js
{
    "id": "id видео",
    "title": "Заголовок видео",
    "counter": "Счетчик просмотров",
    "resourcetype": "Тип контента [VideoContent, AudioContent, TextContent]",
    "video_url": "Ссылка на видео",
    "subtitles_url": "Ссылка на субтитры" 
}
```
##### Аудио
```js
{
    "id": "id аудио",
    "title": "Заголовок аудио",
    "counter": "Счетчик просмотров",
    "resourcetype": "Тип контента [VideoContent, AudioContent, TextContent]",
    "bitrate": "Битрейт в количество бит в секунду"
}
```
##### Текст
```js
{
    "id": "id текста",
    "title": "Заголовок текста",
    "counter": "Счетчик просмотров",
    "resourcetype": "Тип контента [VideoContent, AudioContent, TextContent]",
    "text": "Текст"
}
```
