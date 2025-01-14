# Use an official Python runtime as the base image
FROM python:3.13-slim

# Set environment variables to avoid buffering
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt into /app inside the container
COPY ./requirements.txt /requirements.txt 

# Install dependencies (from inside the /app folder)
RUN pip install --no-cache-dir -r /requirements.txt

# Copy the entire APIService directory into /app inside the container
COPY . /app  
# Expose port 8000
EXPOSE 8000

# Command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]