FROM python:3.12.2

# Installed git and curl to ensure build tools install clean
RUN apt-get update && \
    apt-get install -y --no-install-recommends git curl mediainfo libmediainfo0v5 libmediainfo-dev ca-certificates && \
    ldconfig && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /DreamxBotz

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip --root-user-action=ignore && \
    pip install --no-cache-dir -r requirements.txt --root-user-action=ignore

COPY . .

CMD ["python3", "bot.py"]
