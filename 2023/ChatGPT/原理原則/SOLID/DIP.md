# Dependency Inversion Principle

依存関係逆転の原則（Dependency Inversion Principle, DIP）は、SOLID原則の一つで、システムの設計において高レベルのモジュールが低レベルのモジュールに依存しないようにする原則です。DIPは、次の2つの基本的なガイドラインから成り立ちます：

1. 高レベルのモジュール（ポリシーを持つモジュール）は、低レベルのモジュール（詳細を扱うモジュール）に依存すべきではない。
抽象は詳細に依存すべきではない。詳細が抽象に依存すべきである。
2. これは、具体的な実装ではなく、抽象に依存することで、システム間の結合度を低く保ち、拡張性と変更の容易さを向上させることができます。

## RubyでのDIPの例

Rubyの動的型付けの性質により、インターフェースや抽象クラスの概念は存在しないので、DIPはDuck Typingやポリモーフィズムを利用して適用できます。

以下は、依存関係逆転の原則を遵守したRubyのコード例です。

```ruby
class LightBulb
  def turn_on
    "Bulb is turned on"
  end

  def turn_off
    "Bulb is turned off"
  end
end

class Switch
  def initialize(bulb)
    @bulb = bulb
  end

  def operate
    @bulb.turn_on
    @bulb.turn_off
  end
end

bulb = LightBulb.new
switch = Switch.new(bulb)
puts switch.operate

```

この例では、Switchクラス（高レベルのモジュール）は、LightBulbクラス（低レベルのモジュール）に直接依存していません。
代わりに、Switchは初期化時に何らかのbulbオブジェクトを受け取り、これに対して操作を行います。
このため、LightBulbクラスの具体的な実装が変わったとしても、または全く別の新しいbulbクラスが作成されたとしても、Switchクラスを変更する必要はありません。

このように、依存関係逆転の原則に従うことで、システムの各部分が疎結合となり、拡張や変更が容易となります。
