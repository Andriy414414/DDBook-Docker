# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python
FROM python:3.10-slim

# Встановимо змінну середовища
ENV APP_HOME /duck_app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Встановимо залежності всередині контейнера
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

# танци с бубном над poetry
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

# Скопіюємо інші файли в робочу директорію контейнера
COPY . .

# Запустимо наш застосунок всередині контейнера
CMD ["python", "DigiDuckBook/main_bot.py"]