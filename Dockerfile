FROM node:6.14.2

MAINTAINER Yubaraj Poudel

#get git and cron

COPY apt_req.txt .
RUN apt-get update && \
	apt-get install -y $(cat apt_req.txt) && \
	rm -rf /var/lib/apt/lists/*
	
RUN git clone https://github.com/CSSEGISandData/COVID-19.git 

HEALTHCHECK --interval=5s --timeout=3s --retries=3 \
CMD curl -f http://localhost:8022/data || exit 1

EXPOSE 8022

COPY crontab /etc/cron.d/datapull-task
RUN chmod 0644 /etc/cron.d/datapull-task
RUN service cron start

COPY alltimedata.js .

RUN npm install moment && npm install csvtojson && npm install fs

CMD ["node", "alltimedata.js"]