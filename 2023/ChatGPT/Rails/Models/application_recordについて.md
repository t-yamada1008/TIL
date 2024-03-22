# application_record.rbって作った覚えないんだけど、rails newのときからあった？

はい、application_record.rb は Rails 5 以降のバージョンで rails new コマンドを実行すると自動的に生成されるファイルです。
このファイルは、すべてのモデルが継承する基底クラスとして機能します。

ApplicationRecord は ActiveRecord::Base を継承し、Railsアプリケーション内の全てのモデルに共通の振る舞いや設定を提供します。
例えば、全モデルで使用されるスコープやメソッドをここに定義することができます。

primary_abstract_class は Rails 6.1 で導入されたメソッドで、特に複数のデータベースを使用する場合に有用です。
これにより、ApplicationRecord を継承するモデルが、デフォルトで同じデータベース接続を共有するようになります。

基本的には、ApplicationRecord は抽象クラスであり、自身のデータベーステーブルは持ちません。
そのため、直接 ApplicationRecord のインスタンスを作成することはありません。
通常、具体的なビジネスロジックは ApplicationRecord を継承した子クラス（例えば User や Post など）に記述します。

rails new コマンドを実行すると自動的に生成されるため、手動で作成した記憶がなくても、プロジェクト内に存在するのは通常のことです。
