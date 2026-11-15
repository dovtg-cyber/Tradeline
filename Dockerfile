# TRADELINE EUROPE — Docker image
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PORT=10000

WORKDIR /app

# requirements.txt must be in the project root next to this Dockerfile
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# app.py, templates/ and static/ are copied into the image
COPY . .

EXPOSE 10000
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT:-10000} --workers 2 --threads 4 --timeout 120 app:app"]
