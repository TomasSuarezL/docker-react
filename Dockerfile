FROM node:alpine as builder
RUN npm install -g yarn
WORKDIR '/app'
COPY package.json .
RUN cat package.json
RUN yarn install 
COPY . .
RUN ls
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html





