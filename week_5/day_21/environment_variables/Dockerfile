FROM debian:latest
ENV EMAIL=admin@test.com
COPY ./display-email.sh /display-email.sh
RUN chmod u+x /display-email.sh
CMD /display-email.sh
RUN echo "this is running during build: email: ${EMAIL}}"
