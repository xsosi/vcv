# Use Python 3.10 slim image as base
FROM python:3.10-slim

# Install system dependencies (ffmpeg, git) and clean up
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app/
COPY . .

# Install pip requirements
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["bash", "start"]