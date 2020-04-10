FROM node:6.14.2

MAINTAINER Yubaraj Poudel

#get git and cron

RUN apt-get update && apt-get install -y git && apt-get install -y cron
RUN git clone https://github.com/CSSEGISandData/COVID-19.git 

EXPOSE 8022

COPY crontab /etc/cron.d/datapull-task
RUN chmod 0644 /etc/cron.d/datapull-task
RUN service cron start

COPY alltimedata.js .

RUN npm install moment && npm install csvtojson && npm install fs

CMD ["node", "alltimedata.js"]