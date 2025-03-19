FROM onlyoffice/documentserver:8.3.1

# 复制默认插件列表到插件目录
# COPY ./builder6/plugin-list-default.json /var/www/onlyoffice/documentserver/sdkjs-plugins/

# 安装 AI 插件到插件目录
# RUN /usr/bin/documentserver-pluginsmanager.sh --install="{9DC93CDB-B576-4F0C-B55E-FCC9C48DD007}"
COPY ./onlyoffice.github.io/sdkjs-plugins/content/ai /var/www/onlyoffice/documentserver/sdkjs-plugins/ai
RUN find /var/www/onlyoffice/documentserver/sdkjs-plugins/ai -type f -name "*.html" -exec sed -i 's#https://onlyoffice.github.io/sdkjs-plugins/#../#g' {} +

# 默认不联网安装插件
ENV PLUGINS_ENABLED=false