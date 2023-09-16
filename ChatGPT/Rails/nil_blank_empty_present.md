# nil?, blank?, empty?, present?

## `nil?` と `blank?` の違いについて

Rubyにおいて、`blank?`と`nil?`はオブジェクトに対して異なる種類の「空っぽかどうか」を調べるメソッドです。それぞれの違いを以下で詳しく説明します。

### `nil?`

- `nil?`はRubyの組み込みメソッドです。
- このメソッドは、オブジェクトが`nil`である場合にのみ`true`を返します。
- それ以外のオブジェクト（空文字列、空配列、空ハッシュ、`false`など）に対しては`false`を返します。

```ruby
nil.nil?       # => true
false.nil?     # => false
"".nil?        # => false
[].nil?        # => false
{}.nil?        # => false
```

### `empty?`

- empty?はRubyの組み込みメソッドであり、配列、ハッシュ、文字列などに対して使用できます。
- このメソッドは、オブジェクトが「空」である（つまり、要素や文字が一つもない）場合にtrueを返します。

```ruby
"".empty?    # => true
[].empty?    # => true
{}.empty?    # => true
```

### `blank??`

- blank?はRuby on RailsのActiveSupportで提供されるメソッドです。
- このメソッドはオブジェクトがnil、false、空文字列、空配列、空ハッシュなどであればtrueを返します。

```ruby
nil.blank?      # => true
false.blank?    # => true
"".blank?       # => true
[].blank?       # => true
{}.blank?       # => true
```

注意: blank?メソッドはRuby on Railsの環境か、ActiveSupportがインストールされている環境でのみ使用できます。純粋なRubyの環境では使用できません。

これらのメソッドはオブジェクトが「空っぽ」かどうかを判定する際に、そのオブジェクトの型や内容に応じて適切なメソッドを選ぶことが重要です。

### `present?`

- present?はRuby on RailsのActiveSupportで提供されるメソッドです。
- blank?とは逆に、オブジェクトが「存在する」（nil、false、空でない）場合にtrueを返します。

```ruby
nil.present?      # => false
false.present?    # => false
"".present?       # => false
[].present?       # => false
{}.present?       # => false
"hello".present?  # => true
[1, 2, 3].present? # => true
{ key: 'value' }.present? # => true
```

これらのメソッドは、それぞれ異なるシチュエーションやオブジェクトのタイプに対して「空っぽ」や「存在する」かどうかを調べるために使用されます。選択するメソッドは、何を調べたいのかによって異なります。
