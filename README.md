# docker-vvveb

1. github.com から givanz / VvvebJs をクローンする

```
git clone https://github.com/givanz/VvvebJs.git
```

2. VvvebJS を docker 化する
 - Dockerfile を追加

```
FROM php:7.2-apache
RUN apt-get -y update
RUN apt-get install -y \
    curl \
    gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g gulp
```

 - docker-compose.yml を追加

```
version: '3'
services:
  vvveb:
    build: .
    ports:
      - 8080: 80
    bolumes:
      - type: bind
        source: ※ホスト側のディレクトリ
        target: /var/www/html
    tty: true
```

 - package.json 行削除 node-sassはdeprecated

 ```
   "node-sass": "^8.0.0",
 ```

3. docker containerを起動

```
>docker-compose up -d
>docker-compose exec vvveb bash
root@コンテナID:/var/www/html# npm i
```

4. ブラウザで確認

```
localhost:8080/editor.html
```

