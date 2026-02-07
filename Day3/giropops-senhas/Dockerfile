FROM cgr.dev/chainguard/python:latest
#FROM python:3.11-alpine
#FROM python:3.11-slim-bookworm
#FROM python:3.11-bookworm
#FROM python:3.11-trixie
#FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
COPY templates templates/
COPY static static/
ENV REDIS_HOST="192.168.15.60"

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]