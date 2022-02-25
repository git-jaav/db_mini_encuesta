FROM mysql/mysql-server:8.0

ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=me_encuesta_db
ENV MYSQL_ROOT_HOST=%

COPY ./scripts/ /docker-entrypoint-initdb.d/
CMD ["--default-authentication-plugin=mysql_native_password"]