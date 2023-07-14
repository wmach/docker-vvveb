# docker-vvveb

## インストール手順

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

## 言語対応

1. 言語対応方針

 - Contributeのページに次の記載があります。
   - [Contribute](https://www.vvveb.com/page/contribute)

```
言語パック
Vvveb は多言語翻訳に gettext を使用します
Poedit などのテキスト エディタを使用して翻訳ファイルを編集し、変更内容を github.com/givanz/Vvveb のコード リポジトリに送信できます。

Language packs
Vvveb uses gettext for multi language translations
You can use a text editor like Poedit to edit translation files and then submit your changes to the code repository at github.com/givanz/Vvveb
```

 - 上記のgithubレポジトリを見ると、現在あるプルリクエストは、オランダ語のみです。
   - https://github.com/givanz/Vvveb/pulls


## テーマ

 - githubのフリーバージョンでは、フル機能バージョンと違い、作成ページにテーマを当てることは不能
   - vvvebの公式ページに掲載されている無料で掲載されているテーマは６つ
     - [フル機能バージョン・テーマ](https://themes.vvveb.com/)


## コンポーネント

 - Bootstrap5 のコンポーネントが９つ組み込まれている

 - 自分で定義して組み込むよう
   - [Components](https://github.com/givanz/VvvebJs/wiki/Components)


