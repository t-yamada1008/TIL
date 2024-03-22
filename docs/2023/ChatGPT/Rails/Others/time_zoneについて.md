# モデルにデータを保存する際にUTCでなくJSTを使いたい

Railsアプリケーションで、モデルにデータを保存する際のタイムゾーンを設定するには、config/application.rb ファイルで config.time_zone と config.active_record.default_timezone の設定を行うことができます。

1. アプリケーションのタイムゾーンを設定する
config.time_zone を Tokyo に設定すると、アプリケーション内の時間表示が日本時間（JST）になります。

```ruby
# config/application.rb
config.time_zone = 'Tokyo'
```

2. ActiveRecordでの時間の保存方法を設定する
config.active_record.default_timezone を :local に設定すると、データベースに保存される時間がアプリケーションのタイムゾーンに従ったものになります。

```ruby
# config/application.rb
config.active_record.default_timezone = :local
```

これらの設定を行った後、アプリケーションを再起動してください。

```ruby
rails restart
```

ただし、一般的に、データベースにはUTCで時間を保存し、表示する際にローカルタイムに変換するのがベストプラクティスとされています。これは、タイムゾーンの違いや夏時間の影響を避けるためです。従って、特に理由がなければ、データベースにはUTCで時間を保存することをお勧めします。

## モデルにはUTCで時間を保存した方がいいってこと？

はい、正確には、データベースにUTC（協定世界時）で時間を保存することが一般的に推奨されています。これにはいくつかの理由があります。

1. タイムゾーンの一貫性:
グローバルに展開するアプリケーションでは、ユーザーが様々なタイムゾーンからアクセスします。UTCを使用すると、異なるタイムゾーン間での時間の変換が容易になります。

2. 夏時間の影響を避ける:
一部の地域では夏時間が採用されており、時間が1時間進められます。UTCを使用することで、このような時間の変更の影響を受けずに済みます。

3. 標準化:
UTCは国際標準として広く採用されており、システム間の互換性が保たれます。

4. バグの予防:
異なるタイムゾーンを跨いだ計算や、タイムゾーンが異なるデータの比較等を行う際にバグのリスクが増えます。UTCを使用することで、これらのリスクを減らすことができます。

以上の理由から、データベースにはUTCで時間を保存し、表示や計算の際に必要に応じてローカルタイムに変換するのが、ベストプラクティスとされています。

## 上司からはDBのsystem_time_zoneはJSTでtime_zoneはSYSTEMと言われてるけど、どういうことかわからない

MySQLにおいて、system_time_zone はオペレーティングシステムのタイムゾーンを示し、time_zone はMySQLサーバーのタイムゾーンを示します。

system_time_zone:
これは、MySQLサーバーが稼働するオペレーティングシステムのタイムゾーン設定を反映します。上司が言及されたJSTは、Japan Standard Timeの略で、これが設定されている場合、システムのタイムゾーンは日本時間となります。

time_zone:
MySQLサーバーで使用されるタイムゾーンを設定します。SYSTEMが設定されている場合、MySQLサーバーのタイムゾーンはオペレーティングシステムのタイムゾーン（system_time_zone）を使用します。したがって、system_time_zoneがJSTで、time_zoneがSYSTEMの場合、MySQLサーバーもJSTを使用します。

ただし、アプリケーションレベルでタイムゾーンのハンドリングができる場合（例えば、Ruby on RailsのActiveRecordを使用する場合）、データベースのtime_zoneはUTCに設定することが一般的に推奨されます。これにより、データベースに保存される時間データはUTCで統一され、アプリケーション側で適切なタイムゾーンに変換してユーザーに表示できます。

## config/application.rb config.time_zone = 'Tokyo'って書かなければrailsも SYSTEMってこと？

config.time_zoneに特に何も設定しない場合、RailsアプリケーションはデフォルトでUTCをタイムゾーンとして使用します。つまり、RailsはSYSTEMのタイムゾーンを自動的に採用するわけではなく、明示的にconfig.time_zoneを設定しない限り、UTCが使用されます。

ただし、ActiveRecord::Base.default_timezoneの設定に依存して、データベースへの読み書きの際のタイムゾーンが異なる場合があります。この設定もデフォルトでは:utcとなっており、データベースとのやり取りはUTCを基準としますが、これを:localに設定すると、システムのタイムゾーン（SYSTEM）を基準にします。

したがって、Railsアプリケーションでシステムのタイムゾーンを使いたい場合は、config.time_zoneをシステムのタイムゾーンに明示的に設定し、必要に応じてActiveRecord::Base.default_timezoneも:localに設定する必要があります。
