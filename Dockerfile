FROM golang:latest

## sqlite3のインストール
RUN apt-get update -qq && apt-get install -y \
    sqlite3 

## 存在しない場合は、ディレクトリ作成される
WORKDIR /go/src/github.com/MasatoTokuse/di

# WORKDIRからの相対パスの位置に配置する
# src配下が全て /go/src/github.com/MasatoTokuse/di 以下にコピーされる
COPY ./src .
COPY ./create_db.sh .

## DBの作成
RUN bash ./create_db.sh

# 使用している外部ライブラリをダウンロード
RUN go get -u github.com/mattn/go-sqlite3
RUN go get -u go.uber.org/dig

# go install で /go/bin 配下に実行ファイルがビルドされ、/go/pkg 配下に実行ファイル以外がビルドされる。
RUN go install github.com/MasatoTokuse/di/di
RUN go install github.com/MasatoTokuse/di