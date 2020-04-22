FROM python:3.7-alpine
MAINTAINER Naty Laza

# env vars
## run in unbufferd mode which is recommended for dockers.
## it doesnt buffer the output, it just prints them directly
ENV PYTHONUNBUFFERED 1

# copy text file to docker and install the dependecies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Make the root dir and copies our app to the docker
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#creating user with only execution permission for security perpuse
#running with root user isnt recommend because someone can have root's power...
RUN adduser -D execuser
USER execuser

