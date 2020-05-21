FROM python:stretch

# Copies everything from the current directory into a file in the 
# Container called app
COPY . /app
# Defines working directory for the other dockerfile commands
WORKDIR /app

# Update PIP and install dependancies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run main app using WSGI server
ENTRYPOINT ["gunicorn"  , "-b", ":8080", "main:APP"]

