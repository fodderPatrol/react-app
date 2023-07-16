FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
ENV NODE_OPTIONS=--openssl-legacy-provider
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html