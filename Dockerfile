FROM ztou/centos7-python3

WORKDIR /app/flask-app

COPY src/app.py .
COPY Pipfile .

RUN ["pip", "install", "--upgrade", "pip"]
RUN ["pip", "install", "--upgrade", "pipenv"]
RUN ["pipenv", "install"]

EXPOSE 5050

COPY startup.sh .
RUN chmod +x startup.sh
CMD ./startup.sh