FROM node:4.6.1

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.7.5 pm2

ENV HOME=/home/app

COPY ./node/* $HOME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME

RUN npm install && npm cache clean
CMD ["pm2", "start", "app.js"]
