# section2

## SSH

・SSHとは
通信方式の一種
主に他のコンピュータに接続してコマンドを実行するのに使われる

## bash

組み込みコマンドと外部コマンドがある

### 組み込みコマンド

bashの中に組み込まれているコマンド

oot@539ec03bbff4:/work# type echo
echo is a shell builtin

### 外部コマンド

bashの外にあるコマンド

root@539ec03bbff4:/work# type cat
cat is hashed (/usr/bin/cat)

外部コマンドはパスが通っている場所にあるものを実行する

root@539ec03bbff4:/work# ls -l /usr/bin/cat
-rwxr-xr-x 1 root root 43416 Sep  5  2019 /usr/bin/cat

fileコマンドでファイルの種類を確認する
root@539ec03bbff4:/work# file /usr/bin/cat
/usr/bin/cat: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=b357ed53c8c9cb1a312f83b28982304effae0135, for GNU/Linux 3.2.0, stripped

ELFとは
Executable and Linkable Formatの略
Linuxで実行ファイルを表現するためのフォーマット
機械語のバイナリファイル

ファイルをダウンロードして、実行権限を付与して実行する

## パス

root@539ec03bbff4:/work# echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

パスの先頭から順番にコマンドを探して実行する
catコマンドを実行するときは、/usr/bin/catを実行する

### which

whichコマンドは、実行ファイルのフルパスを表示します。これは、システムがどのバイナリを実行するか、またはスクリプトがどこに存在するかを知りたいときに便利です。

root@539ec03bbff4:/work# which ls
/usr/bin/ls

### ldd

lddコマンドは、実行可能ファイルが依存している共有ライブラリを表示します。これは、アプリケーションが正しく動作するためにどのライブラリが必要かを知るために使用されます。

root@539ec03bbff4:/work# ldd /usr/bin/ls
        linux-vdso.so.1 (0x00007ffde3fa1000)
        libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007f81a8e08000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f81a8c16000)
        libpcre2-8.so.0 => /lib/x86_64-linux-gnu/libpcre2-8.so.0 (0x00007f81a8b85000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f81a8b7f000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f81a8e5c000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f81a8b5c000)

## ポイント

Linuxのコマンドは、誰かが実際に作ったファイルを実行するだけ

ファイルの種類は、fileコマンドで確認できる
パスは、whichコマンドで確認できる
依存関係は、lddコマンドで確認できる
