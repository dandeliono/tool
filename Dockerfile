# dockerfile

FROM node:16-alpine3.15

WORKDIR /home/app/

# 把 package.json，package-lock.json(npm@5+) 或 yarn.lock 复制到工作目录(相对路径)
COPY package.json *.lock .

# 只安装dependencies依赖
# node镜像自带yarn
RUN yarn --only=prod

# 把其他源文件复制到工作目录
COPY . .

# 替换成应用实际的端口号
EXPOSE 3000

# 这里根据实际起动命令做修改
CMD [ "yarn", "dev" ]
