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

systemd サービスの有効化
作成した systemd サービスを有効化します。これにより、システム起動時に Docker Compose が起動します。

sudo systemctl enable docker-compose-app

サービスの起動
すぐにサービスを起動するには、以下のコマンドを使用します。

sudo systemctl start docker-compose-app

これで、システムが起動するたびに、Docker Composeで定義されたコンテナが自動的に起動するようになります。
