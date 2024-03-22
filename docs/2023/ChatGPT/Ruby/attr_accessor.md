# attr_accessorって何？dbにカラムがなくても使っていいの？

attr_accessorはRubyの機能で、特定のクラスに対してゲッター（getter）とセッター（setter）メソッドを自動的に生成します。
これによって、そのクラスのインスタンスに対して特定の属性を読み書きできるようになります。

データベースのカラムとは無関係であり、モデルがデータベースのテーブルに紐づいていなくても、または紐づいていても、attr_accessorを使うことは可能です。

例えば：

```ruby
class Person
  attr_accessor :name, :age
end
```

このPersonクラスのインスタンスは、nameとageという属性を持つことになり、以下のようにアクセスできます。

```ruby
p = Person.new
p.name = "Alice"
puts p.name  # => "Alice"
```

このnameとageはデータベースのカラムとは無関係な、オブジェクトが持つ仮想的な属性（またはインスタンス変数）です。ですので、データベースにカラムが存在しなくても、この仕組みは問題なく動作します。

また、データベースにカラムが存在する場合でも、attr_accessorを使うことは可能です。この場合、データベースのカラムと同じ名前の属性を持つことになりますが、これは問題ありません。

```ruby
class Person < ActiveRecord::Base
  attr_accessor :name, :age
end
```

このPersonクラスのインスタンスは、nameとageという属性を持つことになり、以下のようにアクセスできます。

```ruby
p = Person.new
p.name = "Alice"
puts p.name  # => "Alice"
```
