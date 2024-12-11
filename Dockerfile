FROM python:3.10

WORKDIR /app

# Встановлення залежностей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо всі файли
COPY . .

# Експортуємо порт, на якому ваш додаток працює
EXPOSE 5000

# Команда для запуску додатку з gunicorn
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:${PORT}"]

