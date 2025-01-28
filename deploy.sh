#!/bin/bash

# Переменные
APP_DIR="../app"
BUILD_DIR="./app"
DIST_DIR="./app/dist"
TARGET_DIR="."
BUILD_ENV=$1
BUILD_TARGET=$2

# Копируем приложение
cp -r $APP_DIR $BUILD_DIR

# Переходим в директорию приложения
cd $BUILD_DIR || exit

# Выполняем сборку приложения
npm run build:$BUILD_ENV:$BUILD_TARGET

# Возвращаемся в предыдущую директорию
cd .. || exit

# Копируем файлы из папки dist в целевую директорию
cp -r $DIST_DIR/* $TARGET_DIR

# Добавляем изменения в git
git add .

# Создаем коммит с сообщением "deploy"
git commit -m "deploy"

# Отправляем изменения в удаленный репозиторий
git push

# Уведомление об успешном выполнении скрипта
echo "Deploy script executed successfully."