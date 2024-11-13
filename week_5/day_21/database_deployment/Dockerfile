FROM postgres:latest
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydatabase
RUN echo "listen_addresses = '*'" >> /usr/share/postgresql/postgresql.conf
RUN echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/pg_hba.conf
RUN echo "host    all             all             ::/0                 md5" >> /etc/postgresql/pg_hba.conf
EXPOSE 5432
CMD ["postgres"]
