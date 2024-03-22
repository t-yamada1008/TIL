# keys メソッド

keys メソッドはRubyのHashクラスに属しています。
ハッシュから全てのキーを配列として返します。
Railsでは、関連する定数のセットを管理するための enum と一緒によく使用されます。

使用例:

```ruby
# Blogが以下のようなenum定義を持っていると仮定
enum category: { tech: 0, personal: 1, lifestyle: 2 }
```

```ruby
# すべてのカテゴリキーを配列として取得
Blog.categories.keys
# => ["tech", "personal", "lifestyle"]
```

このメソッドは特に、フォームのセレクトフィールドに表示するためにハッシュのキーを反復処理する場合に役立ちます。
