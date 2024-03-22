# belongs_toのidがない場合のエラーを何とかしたい。異常系だから、idがnullなのが正しいのだけど、requireのエラーが出る。

Railsのbelongs_to関連付けは、デフォルトで必須になっています。Rails 5からは、belongs_to関連付けは自動的に必須とされるように変更されました。そのため、関連付けられているオブジェクトのIDがnilの場合、バリデーションエラーが発生します。

このバリデーションを無効にするには、optional: trueオプションを使用します。

例えば、BannerモデルがStationモデルにbelongs_to関連付けを持っている場合、以下のように修正します。

```ruby
class Banner < ApplicationRecord
  belongs_to :station, optional: true
  # 他のコード
end
```

この変更により、Bannerモデルのstation_idがnilであってもバリデーションエラーは発生しません。

ただし、この変更をすると、station_idがnilでもBannerオブジェクトを保存できるようになりますので、アプリケーションの要件に合わせて注意深く使用してください。

## optional: trueでの後にカスタムバリデーションでerrorsを追加すれば処理は止まるの？

はい、optional: trueを使ってbelongs_to関連付けの必須性を無効にした後、カスタムバリデーションでエラーを追加すると、モデルは無効とされ、保存処理は止まります。

たとえば、Bannerモデルにstation_idのカスタムバリデーションを追加する場合、以下のようなコードを使用できます。

```ruby
class Banner < ApplicationRecord
  belongs_to :station, optional: true

  validate :custom_station_validation

  def custom_station_validation
    if [何らかの条件]
      errors.add(:station, 'カスタムのエラーメッセージ')
    end
  end
end
```

この場合、custom_station_validationメソッド内の条件がtrueの場合、カスタムのエラーメッセージがerrorsオブジェクトに追加され、@banner.valid?はfalseを返します。その結果、@banner.saveはfalseを返し、データベースへの保存処理は実行されません。

したがって、optional: trueを使用しても、カスタムバリデーションでのエラーの追加によって、必要に応じて保存処理を止めることができます。
