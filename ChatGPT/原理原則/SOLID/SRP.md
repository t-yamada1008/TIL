# Single Responsibility Principle (SRP) - 単一責任の原則

単一責任の原則（Single Responsibility Principle, SRP）は、SOLID原則の一つで、クラスが持つべき責任は一つだけであるという原則です。
この原則は、ソフトウェアの設計をより柔軟にし、変更を容易にし、そして理解しやすくするために用います。

## 単一責任の原則の基本概念

一つのクラスは、一つの責任または懸念事項（concern）だけを持つべきです。
クラスが変更される理由は一つだけであるべきです。

## SRPの利点

- 可読性: クラスが単一の責任を持つと、コードは読みやすく、理解しやすくなります。
- 可維持性: 修正や変更が必要な場合、影響を受けるのは一つのタスクや懸念事項だけになります。
- 拡張性: 新しい機能を追加する際に、既存のコードへの影響を最小限に抑えることができます。
- テストしやすさ: 単一の責任を持つクラスは、テストしやすくなります。

## 例

Rubyにおいて、Single Responsibility Principle（SRP）を適用した例を以下に示します。
単一責任の原則に基づき、各クラスは一つの責任だけを持つべきです。

```ruby
# Userクラスは、ユーザーの情報を持つだけの責任を持ちます。
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# UserRepositoryクラスは、ユーザーのデータの保存と読み出しの責任を持ちます。
class UserRepository
  def initialize
    @users = []
  end

  def add_user(user)
    @users << user
  end

  def find_user(name)
    @users.find { |user| user.name == name }
  end
end

# 使用例
user = User.new('John')
repository = UserRepository.new
repository.add_user(user)
puts repository.find_user('John').name  # => John
```

この例では、Userクラスはユーザーの情報を持つことが責任であり、UserRepositoryクラスはユーザーの情報の保存と読み出しを行うことが責任です。
このようにして、各クラスが一つの責任だけを持つことで、コードの保守性、可読性、そしてテストの容易性が向上します。
