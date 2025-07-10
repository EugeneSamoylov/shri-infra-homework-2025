# Используем официальный образ Node.js
FROM node:16-alpine

# Создаем рабочую директорию
WORKDIR /app

# Копируем зависимости
COPY package*.json ./
COPY .npmrc ./

# Устанавливаем зависимости
RUN npm ci

# Копируем весь код
COPY . .

# Собираем приложение
RUN npm run build

# Открываем порт
EXPOSE 3000

# Запускаем приложение
CMD ["npm", "start"]