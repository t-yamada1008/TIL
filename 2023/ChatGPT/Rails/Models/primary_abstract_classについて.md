# primary_abstract_classってなんだっけ

Rails 6.1 で導入された primary_abstract_class は、Active Record の抽象クラスを定義するためのメソッドです。
これは、複数のデータベースに接続する際に特に有用で、異なるデータベース接続を持つモデル群が共通の抽象クラスを継承する際に使用されます。

具体的には、primary_abstract_class を使用すると、そのクラスを継承する全てのモデルがデフォルトで同じデータベース接続を共有するようになります。
これにより、特定のデータベース接続を使用するモデル群を効率的に管理できます。

例えば、ある特定のデータベース（例えばレポート用のデータベース）への接続設定を持つ抽象クラスを作成する場合、以下のように定義することができます：

```ruby
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class ReportRecord < ApplicationRecord
  self.primary_abstract_class
  connects_to database: { writing: :reports, reading: :reports_replica }
end

class Report < ReportRecord
  # このクラスは自動的に :reports データベース接続を使用する
end
```

この例では、ReportRecord は ApplicationRecord を継承しており、特定のデータベース（reports）に接続するように設定されています。
Report クラス（および ReportRecord を継承する他のすべてのモデル）は、このデータベース接続を自動的に使用するようになります。

primary_abstract_class は、データベース接続の設定を継承するモデルの階層において、どのクラスが「主要な」抽象クラスであるかをRailsに通知するのに役立ちます。これは、大規模なアプリケーションやマイクロサービスアーキテクチャで特に有用です。

## self.abstract_class = true と primary_abstract_class は同じだよね

はい、そのとおりです。
Rails 6.1 から導入された primary_abstract_class は、self.abstract_class = true を暗黙的に含んでいます。

つまり、primary_abstract_class を使用することは、そのクラスが抽象クラスであることを示し、かつそのクラスが複数データベース接続の主要な抽象クラスであることをRailsに伝えます。

簡単に言うと、primary_abstract_class を使用する場合、self.abstract_class = true を明示的に記述する必要はありません。
primary_abstract_class は以下の2つの機能を兼ね備えています：

- クラスが抽象クラスであることを設定する（self.abstract_class = true と同じ）。
- 複数データベース接続を使用する場合に、その抽象クラスが「主要な」抽象クラスであることを示す。

したがって、以下のように記述されている場合：

```ruby
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
```

これは、以下と同じ意味を持ちます：

```ruby
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
```

ただし、primary_abstract_class は複数データベース接続の文脈で特に有用であり、Rails 6.1以降でのみ利用可能です。単一のデータベース接続を使用する場合、またはRails 6.0以前を使用している場合は、従来通り self.abstract_class = true を使用します。
