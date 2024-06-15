# Use Python 3.10 slim image as base
FROM python:3.10-slim

# Install necessary system dependencies (like ffmpeg)
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app/
COPY . /app/

# Set the working directory in the container
WORKDIR /app/

# Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -U -r requirements.txt

# Set the command to run when the container starts
CMD ["bash", "start"]