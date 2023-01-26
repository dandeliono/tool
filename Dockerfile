# dockerfile

FROM node:16-alpine3.15

WORKDIR /

# 把 package.json，package-lock.json(npm@5+) 或 yarn.lock 复制到工作目录(相对路径)
COPY package.json *.lock .

# 只安装dependencies依赖
# node镜像自带yarn
RUN yarn --only=prod
RUN yarn generate

FROM nginx:alpine

COPY  /dist/ /usr/share/nginx/html/

EXPOSE 80
