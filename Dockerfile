FROM node:16.15.0-alpine3.15 As Build

WORKDIR /usr/src/app

COPY package*.json .
COPY tsconfig*.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:16.15.0-alpine3.15 As Prod

WORKDIR /usr/src/app

# multi-stage build 전략으로 필요한 리소스만 가져와서 이미지 크기 감소
COPY --from=Build /usr/src/app/dist ./
COPY --from=Build /usr/src/app/node_modules ./node_modules

EXPOSE 3000

# docker run -it image:tag 실행시 쉘 접근
# CMD ["/bin/sh"]

CMD ["node", "main"]

