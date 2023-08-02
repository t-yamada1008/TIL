# section4 ネットワーク超入門

## ブラウザとWebサーバのやりとり

PC(クライアント)からWebサーバにアクセスするとき、ブラウザはHTTPリクエストを送り、WebサーバはHTTPレスポンスを返す
NIC(Network Interface Card)は、ネットワークに接続するためのインターフェース
NICはクライアントとWebサーバ両方に搭載されているハードウェア

ブラウザはNICを直接操作しているわけではない
ハードウェアの操作はOSが行う

OSはNICを操作するためのソフトウェアを持っている
通信はOSのプロトコルスタックに協力してもらう

ブラウザは通信の機能を使いたい場合はSocketライブラリを使う

SocketライブラリはOSのプロトコルスタックを使って通信を行う

ブラウザはSocketライブラリを使って、OSのプロトコルスタックを使って、NICを操作して、WebサーバにHTTPリクエストを送る

実際にはHTTPリクエストはOSのプロトコルスタックにてパケットに分割され、NICに送られる

パケットがWebサーバに届くと、NICはパケットを受け取り、OSのプロトコルスタックに渡す
パケットからHTTPリクエストが復元され、Webサーバに渡される

## Echoサーバとは

Echoサーバは、クライアントから送られたメッセージをそのまま返すサーバ

root@1a32c14cd6ba:/etc/nginx/work# cat echo_client.rb

```ruby
require 'socket'

# IP Address and Port
socket = TCPSocket.open('127.0.0.1', 7777)

# Input stdout 1 line
message = gets

# send message
socket.send(message, 0)

# waitting response ,if recived message read line
response = socket.gets

# puts message
puts "received: #{response}"

# close networking
socket.close
root@1a32c14cd6ba:/etc/nginx/work#
```

root@1a32c14cd6ba:/etc/nginx/work# cat echo_server.rb

```ruby
require 'socket'

ADDRESS = '127.0.0.1'
PORT = 7777

# set IP Address and port, starting receive network
server = TCPServer.open(ADDRESS, PORT)

puts "Echo server started on address #{ADDRESS} port #{PORT}"

while true
  # accept client
  socket = server.accept

  # get message 1 line
  message = socket.gets
  puts "received: #{message}"

  # send response message
  socket.send(message, 0)

  # close networking
  socket.close
end

# close server
server.close
```

## IPアドレス、ポート番号、メッセージとは

重要なのは、IPアドレスとポート番号を指定すること

### IPアドレス

IPアドレスは、ネットワーク上の住所のようなもの
通信する先のコンピュータは、IPアドレスで決まる

203.112.0.10のように、0~255の数字が4つ並んだものがIPアドレス
これはIPv4と呼ばれる

127.0.0.1は、自分自身を指す特別なIPアドレス
別名localhostと呼ばれる

### ポート番号

ポート番号は、よくマンションの部屋番号に例えられる

1つのコンピュータには、たくさんのプログラムが動いている
それぞれのプログラムは、ポート番号で区別される

複数のプログラムが通信を待っていたりするため、ポート番号によって、どのプログラムに接続するのかを伝える

0~65535の数字がポート番号として使われる

```bash
root@1a32c14cd6ba:/etc/nginx/work# ss -antup
Netid         State          Recv-Q         Send-Q                 Local Address:Port                 Peer Address:Port        Process
tcp           LISTEN         0              4096                       127.0.0.1:7777                      0.0.0.0:*            users:(("ruby",pid=4280,fd=5))
tcp           LISTEN         0              511                          0.0.0.0:80                        0.0.0.0:*            users:(("nginx",pid=1354,fd=6))
tcp           LISTEN         0              511                             [::]:80                           [::]:*            users:(("nginx",pid=1354,fd=7))
```

root@1a32c14cd6ba:/etc/nginx/work# ps aux | grep 4280
root      4280  0.0  0.2  74880 21816 pts/2    S+   20:38   0:00 ruby echo_server.rb
root      4283  0.0  0.0   3312   716 pts/1    S+   20:40   0:00 grep --color=auto 4280

root@1a32c14cd6ba:/etc/nginx/work# ps aux | grep 1354
root      1354  0.0  0.0  51212  1500 ?        Ss   18:44   0:00 nginx: master process /usr/sbin/nginx
root      4287  0.0  0.0   3312   720 pts/1    S+   20:41   0:00 grep --color=auto 1354

### メッセージ

・Echoサーバの場合

Echoクライアント
標準入力に入力された内容をそのまま送信

Echoサーバ
受け取ったメッセージをそのまま返信

・Webサーバ(Nginxなど)の場合

HTTPリクエスト、HTTPレスポンスという形式でメッセージをやりとりする

クライアントとサーバが適切にやりとりするために、通信方式ごとにメッセージの形式が決まっている

### ip a

ip aは、IPアドレスを表示するコマンド

```bash
root@1a32c14cd6ba:/etc/nginx/work# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: tunl0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
3: ip6tnl0@NONE: <NOARP> mtu 1452 qdisc noop state DOWN group default qlen 1000
    link/tunnel6 :: brd ::
11: eth0@if12: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
```

Nginxの0.0.0.0は特別なIPアドレス
どのIPアドレスからの通信も受け付けることを意味する

127.0.0.1が指定されていると、localhostからの通信のみ受け付ける
その設定のせいで、localhost以外からの通信は受け付けないエラーが起きたりする

## curlとtelnetでWebサーバとやりとりする

curlは、HTTPリクエストを送信して、HTTPレスポンスを受け取るコマンド

```bash
root@1a32c14cd6ba:/etc/nginx/work# curl http://localhost
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

curl -vでHTTPリクエストとHTTPレスポンスの詳細を表示する

```bash
root@1a32c14cd6ba:/etc/nginx/work# curl -v http://localhost
*   Trying 127.0.0.1:80...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 80 (#0)
> GET / HTTP/1.1
> Host: localhost
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Server: nginx/1.18.0 (Ubuntu)
< Date: Wed, 02 Aug 2023 11:56:43 GMT
< Content-Type: text/html
< Content-Length: 612
< Last-Modified: Wed, 02 Aug 2023 02:51:18 GMT
< Connection: keep-alive
< ETag: "64c9c4a6-264"
< Accept-Ranges: bytes
< 
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
* Connection #0 to host localhost left intact
root@1a32c14cd6ba:/etc/nginx/work# 
```

## telnet

telnetは、TCP通信を行うコマンド

```bash
root@1a32c14cd6ba:/etc/nginx/work# telnet localhost 80
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
GET / HTTP/1.1
Host: localhost
User-Agent: curl/7.68.0
Accept: */*

HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
Date: Wed, 02 Aug 2023 12:02:13 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Wed, 02 Aug 2023 02:51:18 GMT
Connection: keep-alive
ETag: "64c9c4a6-264"
Accept-Ranges: bytes

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

## TCP/IPモデルとは

TCP/IPモデルは、ネットワークの通信を分類したもの

現在一般的に使われているネットワークのプロトコル(通信方式)は、TCP/IPモデルという階層構造になっている。

TCP/IPモデルは、4つの階層に分かれている

・アプリケーション層
  メッセージの形式や、通信の手順を決める
  ex: HTTP, SSH, FTP, SMTP

・トランスポート層
  接続の確立、パケットの分割と組み立てなど
  ex: TCP, UDP

  なお、ポート番号はトランスポート層で使われる

・インターネット層
  IPアドレスで指定された先にパケットを送る
  ex: IP, ICMP

・ネットワークインターフェース層
  ハードウェアが通信を実現する
  ex: Ethernet(有線LAN), IEEE802.11(無線LAN)

通信のトラブルシューティングを行うときは、TCP/IPモデルを意識するとよい

メッセージがおかしい場合は、アプリケーション層の問題
メッセージが正しいが、通信ができない場合は、トランスポート層の問題
メッセージが正しいが、相手に届かない場合は、インターネット層の問題
メッセージが正しいが、自分のハードウェアがおかしい場合は、ネットワークインターフェース層の問題
