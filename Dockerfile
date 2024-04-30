FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN apk update && apk upgrade && apk add git

COPY start.sh /start.sh

ENV REPOSITORY=https://github.com/hinak0/hinak0.github.io.git
ENV BRANCH=gh-pages
ENV INTERVAL=300

EXPOSE 80

CMD ["/start.sh"]
