# なぜnvm

- 一番主流っぽそう。
- GitHubスター数が15.4k
- npm環境あれば問題なさそう

npmはnvm(node version manager)かnだけど、nvmインストール。
nは単語一文字っていうのが調べづらそう。
rbenvに近そうだし。

[https://github.com/nvm-sh/nvm?tab=readme-ov-file#intro]

今回はこれ。
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

