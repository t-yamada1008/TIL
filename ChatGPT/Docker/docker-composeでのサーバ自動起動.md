# docker-composeでのサーバ自動起動

はい、docker-composeを使用して、コンテナを自動で起動できます。通常、システムが起動するときにDockerコンテナを自動起動するには、systemd サービスを作成します。以下は、基本的な手順ですが、システムの設定や要件に応じて調整が必要かもしれません。

docker-composeファイルの用意
docker-compose.yml ファイルをプロジェクトディレクトリに配置します。

systemd サービスファイルの作成
/etc/systemd/systemディレクトリに .service ファイルを作成します。例えば、docker-compose-app.service という名前で以下の内容を配置することができます。

```bash
[Unit]
Description=Docker Compose Application Service
Requires=docker.service
After=docker.service

[Service]
WorkingDirectory=/path/to/your/project
ExecStart=/usr/local/bin/docker-compose up
ExecStop=/usr/local/bin/docker-compose down
TimeoutStartSec=0
Restart=always
RestartSec=10s

[Install]
WantedBy=multi-user.target
```

この例では、/path/to/your/project を実際のプロジェクトのパスに置き換えてください。また、docker-compose のパスが /usr/local/bin/docker-compose でない場合は、適切なパスに変更してください。

1. systemd サービスの有効化

    作成した systemd サービスを有効化します。これにより、システム起動時に Docker Compose が起動します。

    ```bash
    sudo systemctl enable docker-compose-app
    ```

2. サービスの起動

    すぐにサービスを起動するには、以下のコマンドを使用します。

    ```bash
    sudo systemctl start docker-compose-app
    ```

    これで、システムが起動するたびに、Docker Composeで定義されたコンテナが自動的に起動するようになります。

## docker-composeにrestart書くのでも出来ると聞いたけど、どうなの

docker-compose.yml ファイルにおいて、サービスが失敗した場合に再起動を試みるために、restart ポリシーを設定することができます。
これによって、特定のサービスが異常終了した場合でも、Dockerが自動的にそのサービスを再起動してくれます。

以下は、docker-compose.yml ファイルにおける restart ポリシーの基本的な使い方です。

```yml
version: '3'
services:
  web:
    image: nginx
    restart: always
```

restart ポリシーにはいくつかのオプションがあります。

- no: これはデフォルト。コンテナは再起動されません。
- always: コンテナが停止した場合、何度でも再起動します。
- on-failure[:max-retries]: コンテナが非ゼロのステータスで終了した場合に再起動します。オプションで再起動の最大試行回数を指定できます。
- unless-stopped: コンテナが明示的に停止されない限り、コンテナが停止した場合は常に再起動します。

例えば、特定のサービスが失敗した場合に、最大で5回まで再起動を試みたい場合は、以下のように設定します。

```yml
version: '3'
services:
  web:
    image: nginx
    restart: on-failure:5
```

この restart ポリシーを使用すると、Docker Composeで定義された各サービスが予期せぬ理由で終了した場合に、
自動的に再起動を試みるため、システムの耐障害性を向上させることができます。
