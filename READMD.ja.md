# atc-remote

[code-server](https://github.com/coder/code-server)上で動作する[AtCoder](https://atcoder.jp/)用開発環境

# 使い方

## インストール

このソフトは docker イメージの形で使用します。

`PASSWORD`環境変数を固有の強力なパスワードに変更してください。

docker run の例:

```Shell
docker run -d -e PASSWORD=password -p 8080:8080 -v ./home:/home/coder kentaro1043/atc-remote
```

docker compose の例:

```yaml
version: "3"

services:
    atc:
        image: kentaro1043/atc-remote
        restart: unless-stopped
        environment:
            - "PASSWORD=password"
        volumes:
            - "./home:/home/coder"
        ports:
            - "8080:8080"
```

コンテナ起動後、http://&lt;your-server-ip&gt;:8080 にブラウザからアクセスします。

起動時点で、デフォルトで[atcoder-cli](https://github.com/Tatamo/atcoder-cli)と[online-judge-tools](https://github.com/online-judge-tools/oj)がインストールされています。

## 環境変数

次の環境変数を設定する必要があります。
|環境変数|説明|
|:---|:---|
|PASSWORD|code-server へのアクセス時に必要となるパスワード|

## ボリューム

パフォーマンスなどの観点から、ホームディレクトリを全てボリュームにすることを望まない場合、次の全てのボリュームをマウントすることをお勧めします。

| パス                                        | 説明                      |
| :------------------------------------------ | :------------------------ |
| /home/coder/workspace                       | 作業ディレクトリ          |
| /home/coder/.config/atcoder-cli-nodejs      | atcoder-cli 用設定        |
| /home/coder/.local/share/online-judge-tools | online-judge-tools 用設定 |

## ポート

次のポートをバインドする必要があります。
|ポート|説明|
|:---|:-|
|8080|code-server へのアクセス用ポート|

## SSL 化

このイメージは現在、SSL 化の方法を提供していません。[nginxproxy/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy)イメージなどのリバースプロキシを使うことをお勧めします。

# 謝辞

このイメージの開発は、次のオープンソースソフトウェアによって成り立ちました。

-   [code-server](https://github.com/coder/code-server)

-   [atcoder-cli](https://github.com/Tatamo/atcoder-cli)

-   [online-judge-tools](https://github.com/online-judge-tools/oj)

# 開発者

[けんたろう](https://github.com/Kentaro1043)
