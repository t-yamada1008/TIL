# GitHub Actionsのワークフローって何？どう導入すればいいの？

GitHub Actionsは、GitHubリポジトリ内でCI/CD（Continuous Integration / Continuous Deployment）ワークフローを自動化するためのツールです。
これによって、コードのビルド、テスト、デプロイなどを自動的に行うことができます。

## GitHub Actionsのワークフローの作成手順

GitHubリポジトリのルートディレクトリに .github/workflows ディレクトリを作成します。
このディレクトリ内に、ワークフローの定義ファイルをYAML形式で作成します。例えば、 main.yml など。
YAMLファイル内に、ワークフローのジョブ、ステップ、タスクを定義します。
以下は、シンプルなGitHub Actionsのワークフローの例です。この例では、リポジトリにプッシュされるたびに、Node.jsアプリケーションのビルドとテストが実行されます。

```yml
# .github/workflows/main.yml

name: Node.js CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [12.x, 14.x, 16.x]

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v2
      with:
        node-version: ${{ matrix.node-version }}

    - name: Install dependencies
      run: npm ci

    - name: Run tests
      run: npm test
```

## ワークフローの導入

1. 上記の手順で .github/workflows ディレクトリにYAMLファイルを作成します。
2. YAMLファイルをリポジトリにコミットしてプッシュします。
3. GitHubリポジトリの Actions タブを開いて、ワークフローの実行状態を確認できます。

ワークフローが正しく機能していれば、GitHub Actionsはコードの変更を自動で検知し、定義したタスクを実行します。これによって、コードの品質を維持し、デプロイプロセスを自動化することができます。

## developmentブランチにpushしてみたけど、mainにマージしないと動かない？

GitHub Actionsのワークフローは、デフォルトでmainブランチにプッシュした際にのみ実行される設定になっているかもしれませんが、特定のブランチにプッシュされたとき、またはプルリクエストが作成されたときなど、様々なイベントでワークフローをトリガーすることができます。

onの下に、どのイベントでワークフローを実行するか定義できます。例えば、developmentブランチにプッシュされた際にワークフローを実行したい場合は、次のように設定できます

```yml
on:
  push:
    branches:
      - development
```

また、複数のブランチでワークフローをトリガーすることもできます：

```yml
on:
  push:
    branches:
      - main
      - development
```

プルリクエストが開かれたときにもワークフローを実行したい場合は、以下のように設定できます：

```yml
on:
  push:
    branches:
      - main
      - development
  pull_request:
    branches:
      - main
      - development
```

これで、developmentブランチにプッシュしたり、developmentブランチからmainブランチへのプルリクエストが作成されたりした際にも、GitHub Actionsのワークフローが実行されるようになります

## Assign author to issue Resource not accessible by integrationの警告が出ている

該当するリポジトリのSettings > Actions > General > Workflow permissionsを
Read repository contents permission から Read and write permissions に変更すると解決

<https://zenn.dev/tatsugon/articles/github-actions-permission-error>
