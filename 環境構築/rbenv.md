# rbenv設定

1. which rubyで場所を確認
2. rbenvに設定
3. rbenvでインストールした値をセットする

## which rubyがrbenvでなく/usr/bin/rubyになる

which rubyが/usr/bin/rubyを指すようになるのは、rbenvが正しく設定されていないか、あるいはシステムのRubyがPATH環境変数でrbenvよりも先に検索されるようになっているためです。rbenvを使ってRubyのバージョンを管理している場合、rbenvが提供するRubyのバージョンがwhich rubyで表示されるようにするためには、以下の手順を確認してください：

パスの確認: echo $PATHを実行して、rbenvのシム（shim）ディレクトリがPATHの先頭にあることを確認します。正しく設定されていれば、~/.rbenv/shimsが最初に表示されるはずです。そうでない場合は、~/.bashrc、~/.zshrc、または使用しているシェルの設定ファイルに以下の行を追加または修正します：

```bash
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

上記の変更を適用した後、新しいシェルセッションを開くか、設定ファイルを再読み込みしてください（例：source ~/.bashrc）。

rbenvの初期化: シェルの設定ファイルでrbenv initが正しく呼び出されていることを確認します。これは通常、シェルの設定ファイル（~/.bashrcや~/.zshrcなど）に記述します。

バージョンの設定: rbenvを使ってRubyのバージョンを設定していることを確認します。rbenv globalコマンドを使用してシステム全体のデフォルトRubyバージョンを設定できます。例えば、インストールされているRubyのバージョンが2.7.0であれば、以下のコマンドを実行します：

```bash
rbenv global 2.7.0
```

シム（shim）の再構築: Rubyのインストールやバージョン変更後には、rbenv rehashコマンドを実行して、rbenvのシム（shim）を再構築する必要があります。

これらの手順を完了した後にwhich rubyを実行すると、rbenvによって設定されたRubyのパス（例：~/.rbenv/shims/ruby）が表示されるはずです。
これで、rbenvを通じて管理されるRubyバージョンが正しく使用されます。