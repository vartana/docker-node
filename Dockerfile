FROM node:4.6.1

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install pm2 -g

ENV HOME=/home/app

COPY ./node/DataOwlServer* $HOME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME

RUN npm install && npm cache clean
CMD ["node", "app.js"]

EXPOSE 5000
