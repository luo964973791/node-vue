### vue 项目流程.

```javascript
docker run -it --rm node:alpine sh
export https_proxy=http://192.168.1.1:7890/ #使用代理下载依赖.
npm install -g @vue/cli
vue create project   #选择[Vue 3]
cd project
npm install
npm run build
```


### Dockerfile多级构建.

```javascript
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

# 复制构建好的文件到nginx的html目录
COPY --from=build-stage /app/dist /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动nginx
CMD ["nginx", "-g", "daemon off;"]
```
