# ビルド
`docker build -t di/golang:1.0 .`

# アプリの起動
`docker run --rm -it -p 8000:8000 --name di di/golang:1.0 /go/bin/di`

# アプリにアクセス
http://localhost:8000/people

# コンテナ内での操作
`docker run --rm -it -p 8000:8000 --name di di/golang:1.0 /bin/bash`