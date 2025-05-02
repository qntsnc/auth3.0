FROM node:18-alpine

# Установка зависимостей для компиляции нативных модулей
RUN apk add --no-cache python3 make g++

WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем остальные файлы проекта
COPY . .

# Открываем порт 3000
EXPOSE 3000

# Команда для запуска приложения
CMD ["npm", "start"]