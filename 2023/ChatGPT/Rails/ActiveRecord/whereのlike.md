# railsのwhereでlikeを使いたい

Railsでwhereメソッドを使ってLIKE検索を行うには、以下のように書くことができます。
ここでは、例としてUserモデルがあり、nameフィールドに対して部分一致検索を行います。

基本的な使用法

```ruby
User.where("name LIKE ?", "%検索語%")
```

%はワイルドカードとして機能し、任意の文字列にマッチします。上記の例では、検索語を含むnameを持つすべてのUserレコードが返されます。

大文字小文字を区別しない検索
大文字小文字を区別せずに検索したい場合は、ILIKEを使用します（ただし、ILIKEはPostgreSQLでのみ利用可能です）。

```ruby
User.where("name ILIKE ?", "%検索語%")
```

複数の条件を組み合わせる
ANDやORを使って、複数の条件を組み合わせることもできます。

```ruby
User.where("name LIKE ? AND email LIKE ?", "%検索語%", "%example.com")
```

Rails 5以降: Arelを使用する
Rails 5以降では、Arelを使ってより複雑なクエリを構築することができます。
Arelを使用すると、SQLを直接書かずにSQLのような複雑なクエリを構築できるため、SQLインジェクションのリスクを低減させることができます。

```ruby
users = User.arel_table
User.where(users[:name].matches("%検索語%"))
```

これらの方法を使うことで、Railsのwhereメソッドを使用して、データベース内でLIKE検索を行うことができます。
使用するデータベースによっては、LIKEやILIKEの挙動が異なる場合があるので注意してください