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
