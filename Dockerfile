FROM registry.app.corpintra.net/dockerhub/nginx:1.25.1-alpine

COPY dist/ /usr/hare/nginx/html
