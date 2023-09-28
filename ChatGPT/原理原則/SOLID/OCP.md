# Open/Closed Principle (OCP) - 開放閉鎖の原則について

開放／閉鎖の原則（Open/Closed Principle、OCP）は、SOLIDの原則の一つで、ソフトウェアの構成要素（クラス、モジュール、関数など）は、拡張に対して開かれているべきであり、修正に対して閉じているべきだという設計原則です。
これは、既存のコードの変更なしに新しい機能を追加できるようにするための原則です。

## 開放／閉鎖の原則の具体的な内容

- 開かれている（Open）： 新しい機能や振る舞いを追加することができる。
- 閉じている（Closed）： 既存のコードは、新しい機能の追加によって変更されるべきではない。

## 利点

- 変更の影響を最小化: 新しい機能の追加や変更によって、既存のコードに影響を与えずに済みます。
- 拡張性: システムが新しい要件や機能に対して、より柔軟に対応できます。
- 保守性: 既存のコードを変更する必要がないため、バグの導入が少なくなります。

この原則に従うことで、ソフトウェアの品質を向上させ、将来の変更や拡張を容易にすることができます。

## 例

Rubyでの開放／閉鎖の原則（OCP）のコード例を以下に示します。
Rubyはダックタイピングが可能な言語なので、インターフェースが必要ない言語です。
代わりに、同じメソッドシグネチャを持つ異なるクラスを使用できます。

```ruby
# Shapeクラスとして振る舞うことが期待されるクラス
class Circle
  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius * @radius
  end
end

# AreaCalculatorは、Shapeクラスとして振る舞う任意のオブジェクトを受け取ることができます。
class AreaCalculator
  def calculate_area(shape)
    shape.area
  end
end

# 使用例
circle = Circle.new(5)
calculator = AreaCalculator.new
puts calculator.calculate_area(circle) # => 78.53981633974483
```

この例では、新しい図形クラスを追加する際に、areaメソッドを実装することで、AreaCalculatorクラスを修正することなく拡張することができます。
例えば、新しくRectangleクラスを追加する際も、AreaCalculatorは変更することなく、新しいクラスで動作します。

```ruby
class Rectangle
  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end
end

# 使用例
rectangle = Rectangle.new(4, 5)
puts calculator.calculate_area(rectangle) # => 20
```

このように、開放／閉鎖の原則を守ることで、既存のコードを変更せずに、新しい機能をシステムに組み込むことができます。
