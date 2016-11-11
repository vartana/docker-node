FROM node:4.6.1

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.7.5

ENV HOME=/home/app

COPY ../node/* $HOME/app/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/app

RUN npm install && npm cache clean
CMD ["node", "index.js"]

EXPOSE 1337
