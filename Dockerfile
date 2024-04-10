FROM node
RUN mkdir -p /app
WORKDIR /app
COPY . /app 
RUN npm i && npm run build

FROM nginx:latest
COPY --from=0 /app/dist/ /usr/share/nginx/html/
COPY --from=0 /app/dist/config/nginx/default.conf /etc/nginx/conf.d/default.conf