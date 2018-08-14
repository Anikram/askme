# ASKME
Приложение-клон известного сервиса [ask.fm](https://ask.fm/). Социальная сеть для общения через вопросы другим пользователям и ответам на свои вопросы.

## Версия руби и рельс
Приложение написано 
ruby 2.4.1
rails 5.1.5

## Системные зависимости
* i18n
* invisible_captcha
* jquery-rails
* listen (>= 3.0.5, < 3.2)
* pg
* puma (~> 3.7)
* rails (~> 5.1.5)
* rails_12factor
* recaptcha
* rubocop
* sqlite3
* tzinfo-data
* uglifier
* web-console (>= 3.3.0)
  
## Установка и запуск
Для запуска в `development` окружении, необходимо иметь установленные `homebrew`, `ruby 2.4.1`, `rvm` или `rbenv`, `rails 5.1.5`, `bundler`. Команды, указанные ниже, выполнять находясь в целевой директории (желаемой директории проекта).

Клонировать репозиторий

``` git clone git@github.com:Anikram/askme.git```

Установить набор гемов

``` bundle ```

Прогнать миграции базы данных
 
``` bundle exec rails db:migrate```

Запустить локальные сервер

``` bundle exec rails server ```

Перейти на страницу `localhost:3000` в браузере.


## Базы данных
В проекте используется база данных `SQLite 3` в `development` окружении и `PostgreSQL` в `production` окружении, для хранения инфомрации о пользователях и вопросах.  
 
## Деплой на Heroku
Проект настроен для деплоя на хероку.Рабочую версию проекта можно посмотреть на [`Heroku`](https://my-ask-clone.herokuapp.com/)

## Разработка
Разработал Александр Маркин, в рамках интенсив-курса Rails от [goodprogrammer.ru](http://goodprogrammer.ru/rails-winter-18/)

2018 год
