# Stage 1: Build the Vue.js app
FROM node:alpine AS build-stage

# 设置工作目录
WORKDIR /app

# 复制整个项目目录到工作目录
COPY . .

# 安装依赖并构建项目
RUN npm install && npm run build

# Stage 2: Serve the app with nginx
FROM nginx:alpine

# 更新并安装 net-tools 和 tcpdump，然后清理缓存
RUN apk update && \
    apk add --no-cache net-tools tcpdump && \
    rm -rf /var/cache/apk/*
    
# 复制构建好的文件到nginx的html目录
COPY --from=build-stage /app/dist /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动nginx
CMD ["nginx", "-g", "daemon off;"]
