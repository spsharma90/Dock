# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.12.3
FROM python:${PYTHON_VERSION}-slim AS base

WORKDIR /app

# Copy the source code into the container.
COPY . .

RUN python -m pip install -r requirements.txt

# Expose the port that the application listens on.
EXPOSE 8080

# Run the application.
CMD gunicorn 'dock1.wsgi' --bind=0.0.0.0:8080
