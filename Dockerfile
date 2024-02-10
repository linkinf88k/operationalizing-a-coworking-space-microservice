# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster

# Set environment variables
ENV APP_PORT=5153
ENV DB_USERNAME=default_username
ENV DB_PASSWORD=default_password
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5432
ENV DB_NAME=postgres

# Set the working directory in the container
WORKDIR /app

# Copy the contents of the analytics directory into the container at /app/analytics
COPY /analytics /app/analytics

# Copy the contents of the database directory into the container at /app/db
COPY /db /app/db

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && pip install -r /app/analytics/requirements.txt

# Make port 5153 available to the world outside this container
EXPOSE 5153

# Run the application with environment variables passed during runtime
CMD ["python", "/app/analytics/app.py"]