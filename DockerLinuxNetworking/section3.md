# Section 3 Webサーバ構築

## Docker上でnginxを動かす

Dockerでは-dオプションを使ってコンテナをデタッチモード（バックグラウンド実行）で起動することが可能です。デタッチモードで起動したコンテナは、シェルからexitしても継続して動作を続けます。

例えば、以下のようにコマンドを実行すると、コンテナをデタッチモードで起動し、その後にnginxをインストール・起動することができます

docker run -it -d -p 8080:80 ubuntu

そして、コンテナの中に入って以下のコマンドでnginxをインストール・起動します

docker exec -it [コンテナIDまたはコンテナ名] /bin/bash

apt update
apt install -y nginx
service nginx start

コンテナをexitしてもnginxは継続して動作します。ホストマシンからは<http://localhost:8080>にアクセスすることでnginxの応答を確認できます

## Webサーバの仕組み

nginxは、<http://xxx.xxx.xxx.xxx/index.html>のようなリクエストに対し、index.htmlというファイルを探して、その中身を送り返す

ファイル名が省略された場合は、Webサーバは設定に従ってHTMLを探す

HTTPリクエストに対して、WebサーバはHTTPレスポンスを返す

## HTMLの表示

root@1a32c14cd6ba:/# ls /var/www/html/
index.nginx-debian.html
root@1a32c14cd6ba:/# cd /var/www/html/
root@1a32c14cd6ba:/var/www/html# ls
index.nginx-debian.html
root@1a32c14cd6ba:/var/www/html# cat index.nginx-debian.html

```html
<!DOCTYPE html>
<html>
<head>　
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

## nginxのconf

nginxの設定ファイルは/etc/nginx/nginx.conf
root@1a32c14cd6ba:/etc/nginx# ls
conf.d        fastcgi_params  koi-win     modules-available  nginx.conf    scgi_params      sites-enabled  uwsgi_params
fastcgi.conf  koi-utf         mime.types  modules-enabled    proxy_params  sites-available  snippets       win-utf

root@1a32c14cd6ba:/etc/nginx# view nginx.conf
root@1a32c14cd6ba:/etc/nginx# view sites-enabled/default
root@1a32c14cd6ba:/etc/nginx#

nginxのconfで色々と設定できる

## プロセスの基本

psmisc

root@1a32c14cd6ba:/etc/nginx# pstree -p
bash(1)---nginx(820)-+-nginx(821)
                     |-nginx(822)
                     |-nginx(823)
                     `-nginx(825)

## コンピュータを構成するハードウェア

・マザーボードの基盤上にCPU、メモリ、ストレージ(HDD/SSD)を取り付けてできている。

核がCPU
CPUは機械語のプログラムを実行する
電源を入れると、CPUはメモリ上の機械語のプログラムを順番に実行する

### カーネルによるプロセス管理

・CPUは本来、「コア」が1つなら1つしかプログラムを動かせない
・OSの中核であるカーネルがCPUの時間をプロセスに順番に割り当てることで、複数のプロセスを同時に動かしているように見せている

カーネルはメモリ管理やファイルシステムなど、OSの中核的な機能を担っている

### Linux起動の流れ

1. 電源が入るとCPUがマザーボードのROMにあるBIOSを実行する
2. BIOSがストレージからメモリにブートローダを読み込んで実行する
3. ブートローダがストレージからメモリにカーネルを読み込む
4. カーネルがinitプロセスを起動する

### initプロセスとは

・PID 1で動く、一番親のプロセスがinitプロセス
・initプロセスのプログラムにはいくつか種類がある。最近のLinuxではsystemdが使われていることが多い

### docker起動のOSにおけるPID 1

Dockerコンテナの設計思想は、一つのコンテナが一つのプロセス（またはサービス）を実行することを前提としています。そのため、通常、コンテナが起動するときは、その主要なプロセス（例えば、ウェブサーバーなど）がPID 1として起動します。これはコンテナの目的がシングルアプリケーションの実行に集中しており、その他のシステムプロセスやデーモンが必要とされないからです。

一方、通常のOSでは、システムの初期化と各種サービスの管理を行うsystemdがPID 1として起動します。しかし、Dockerコンテナでは、systemdは起動せず、代わりにそのコンテナの目的となるプロセス（例えば、ウェブサーバーやデータベースなど）が直接PID 1として起動します。

したがって、あなたがdocker runでコンテナを起動した際に指定したコマンド（この場合bash）がPID 1となり、その中でpstree -pを実行すると、一番上のプロセスがbashであることが表示されます。

systemdを含むフル機能のOS環境が必要な場合、特別にsystemdをサポートするように設計されたDockerイメージを使用する必要がありますが、通常の用途ではそのような必要はないでしょう。

### nginexのインストールとは

・nginxのインストールとは、nginxの実行ファイルをストレージに配置すること
・nginxの起動とは、nginxの実行ファイルを実行すること

### 手でnginxを起動する

root@1a32c14cd6ba:/etc/nginx# /usr/sbin/nginx -g 'daemon off;'

systemdで動かしてもらうと、プロセスの管理をsystemdに任せることができる
logの管理とか落ちても再起動してくれる
