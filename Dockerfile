FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

LABEL maintainer="Soumyaditya Batabyal <soumyaditya2021@gmail.com>"

CMD ["python", "app.py"]