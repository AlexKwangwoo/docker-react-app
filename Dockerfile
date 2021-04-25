# 여기는 빌드할때를 위한공간.. 평소에 만들때는 Docker.dev에서 진행이된다!

FROM node:alpine as builder

WORKDIR '/usr/src/app'

COPY package.json .

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html