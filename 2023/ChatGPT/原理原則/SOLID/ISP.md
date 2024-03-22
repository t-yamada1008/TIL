# Interface Segregation Principle

インターフェース分離の原則（Interface Segregation Principle, ISP）は、SOLIDの原則の一つで、以下のように表現されます。

クライアントは、それが使用しないメソッドに依存すべきではない。
つまり、一つのインターフェースが肥大化して多くのメソッドを持つ場合、そのインターフェースを実装するクラスは、不必要なメソッドも実装しなければならなくなります。
これを避けるために、ISPではインターフェースを具体的で小さく保つべきだと提唱されています。

Rubyは動的型付け言語であり、言語機能としてインターフェースや抽象クラスが存在しないため、ISPの適用は他の静的型付け言語（例えばJavaやC#）とは異なる形になります。
しかし、MixinやDuck Typingを利用して、ISPの精神を遵守することができます。

RubyでのISPの適用例：
以下は、ISPを遵守したRubyのコードの例です。

```ruby
module Walkable
  def walk
    "I can walk"
  end
end

module Swimmable
  def swim
    "I can swim"
  end
end

module Flyable
  def fly
    "I can fly"
  end
end

class Duck
  include Walkable
  include Swimmable
  include Flyable
end

class Penguin
  include Walkable
  include Swimmable
end
```

この例では、Walkable、Swimmable、Flyableといった具体的で小さなモジュール（RubyでのMixin）を定義しています。
各クラスは、必要に応じてこれらのモジュールをインクルードして機能を持つことができます。

これによって、各クラスは必要なメソッドだけを持つことになり、ISPが遵守されます。
