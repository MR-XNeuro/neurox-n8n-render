FROM n8nio/n8n

USER root

# کپی سورس نود سفارشی به داخل کانتینر
COPY custom /data/custom

# نصب وابستگی‌های بیلد به صورت گلوبال
RUN npm install -g typescript gulp-cli

# بیلد نود سفارشی
#WORKDIR /data/custom/n8n-nodes-cronlytic
#RUN npm install --include=dev && npm run build

# دادن دسترسی به کاربر node
RUN chown -R node:node /data

USER node

# معرفی مسیر ماژول به n8n
ENV N8N_CUSTOM_EXTENSIONS=/data/custom

# سایر متغیرهای محیطی
ENV N8N_BASIC_AUTH_ACTIVE=${N8N_BASIC_AUTH_ACTIVE}
ENV N8N_BASIC_AUTH_USER=${N8N_BASIC_AUTH_USER}
ENV N8N_BASIC_AUTH_PASSWORD=${N8N_BASIC_AUTH_PASSWORD}
ENV N8N_ENCRYPTION_KEY=${N8N_ENCRYPTION_KEY}
ENV GENERIC_TIMEZONE=${GENERIC_TIMEZONE}
ENV WEBHOOK_URL=${WEBHOOK_URL}

EXPOSE 5678
