# Use official Python base image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements first (for better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose the app port
EXPOSE 8080

# Run with Gunicorn (better than flask dev server)
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
