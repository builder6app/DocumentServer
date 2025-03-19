FROM onlyoffice/documentserver:8.3.1

# 复制默认插件列表到插件目录
# COPY ./builder6/plugin-list-default.json /var/www/onlyoffice/documentserver/sdkjs-plugins/

# 安装 AI 插件到插件目录
COPY ./onlyoffice.github.io/sdkjs-plugins/content/ai /var/www/onlyoffice/documentserver/sdkjs-plugins/ai

# 替换 html 文件，避免使用 https://onlyoffice.github.io/sdkjs-plugins 外部网址
RUN find /var/www/onlyoffice/documentserver/sdkjs-plugins/ai -type f -name "*.html" -exec sed -i 's#https://onlyoffice.github.io/sdkjs-plugins/#../#g' {} +

# 默认不联网安装插件
ENV PLUGINS_ENABLED=false

# 复制中文字体
RUN rm -rf /usr/share/fonts/*
COPY ./onlyoffice-chinese-fonts/mini_fonts/* /usr/share/fonts
RUN rm /usr/share/fonts/tsimhei.TTF