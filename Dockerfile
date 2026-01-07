# Python base image
FROM python:3.12-slim

# Python, Postgres versions
ARG PYTHON_VERSION=3.12
ARG POSTGRES_VERSION=15

# Env
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DEBIAN_FRONTEND=noninteractive

# Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    curl \
    gnupg2 \
    lsb-release \
    libpq-dev \
    postgresql-client-${POSTGRES_VERSION} \
    postgresql-${POSTGRES_VERSION} \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

# Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . .

# Expose port for PostgreSQL
EXPOSE 5432

CMD bash build.sh
