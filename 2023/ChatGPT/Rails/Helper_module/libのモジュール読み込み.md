# libのモジュール読み込み

libディレクトリに新しいモジュールを作成し、そのモジュールをRailsアプリケーションの他の部分から利用するには、まずlibディレクトリにモジュールのRubyファイルを作成します。次に、そのモジュールを適切な場所で読み込みます。

1. libディレクトリにモジュールを作成する
例えば、lib/my_module.rbというファイルを作成します。

```ruby
# lib/my_module.rb
module MyModule
  def self.my_method
    "Hello from MyModule"
  end
end
```

2. モジュールを読み込む
config/application.rbに以下のコードを追加して、アプリケーションが起動する際にモジュールを読み込みます。

```ruby
# config/application.rb
config.autoload_paths += %W(#{config.root}/lib)
```

3. アプリケーションの他の部分でモジュールを利用する
モジュールを読み込んだ後、アプリケーションの他の部分（コントローラ、モデル、ビューなど）でそのモジュールのメソッドを利用できます。

```ruby
# 例: コントローラでの使用
class MyController < ApplicationController
  def index
    render plain: MyModule.my_method
  end
end
```

これにより、特定のモジュールメソッドをアプリケーション全体で利用できます。もし、特定のクラスにモジュールをインクルードしたい場合は、以下のように行います。

```ruby
class MyClass
  include MyModule
end
```

これでMyClassのインスタンスからmy_methodを呼び出すことができます。
