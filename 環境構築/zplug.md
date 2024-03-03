# zplugをインストール

## brewが動かないときはそこから修正
パーミッションを更新しないといけない

```bash

brew -h
brew install zplug

# これらが出てきた
sudo chown -R $(whoami) /usr/local/Homebrew
sudo chown -R $(whoami) /usr/local/var/homebrew
sudo chown -R takatoshi /usr/local/share/zsh /usr/local/share/zsh/site-functions
chmod u+w /usr/local/share/zsh /usr/local/share/zsh/site-functions
```

## zplugの初期設定

zplugをインストールした後、.zshrcファイルに以下の行を追加して、zplugを初期化します：

```zsh
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
```

上記のパスは、Homebrewがzplugをインストールした場所を指しています。
Apple Siliconチップの場合、通常/opt/homebrewが使用されますが、Intelチップの場合は/usr/localになる可能性があります。適宜確認してください。

## 新しい設定の適用:
.zshrcファイルを編集した後、変更を有効にするために新しいシェルセッションを開くか、次のコマンドを実行します：

```zsh
source ~/.zshrc
```

これで、Homebrewを介してzplugがMacにインストールされ、初期化されました。これにより、zplugを使用して様々なzshプラグインを管理できるようになります。