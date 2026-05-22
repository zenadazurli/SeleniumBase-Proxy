FROM python:3.11-slim

# Installa Chromium, Xvfb e le dipendenze necessarie dai repository standard di Debian
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    xvfb \
    wget \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY test_seleniumbase.py .

# Imposta la variabile d'ambiente per indicare a SeleniumBase di usare Chromium
ENV CHROME_BIN=/usr/bin/chromium

CMD ["python", "test_seleniumbase.py"]
