# 2236. Root Equals Sum of Children

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}
def check_tree(root)
  root.val == root.left.val + root.right.val ? true : false
end

# 解説
# #もちろんです。`TreeNode`クラスについて、以下に詳細な解説を行います。

# ### クラス定義

# ```ruby
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# ```

# #### クラスの構造
# 1. **クラス名**: `TreeNode`
#     - このクラスは、二分木（バイナリツリー）のノードを表すために使われます。

# 2. **`attr_accessor`**
#     - `attr_accessor`は、クラス内のインスタンス変数に対するゲッターとセッターを自動的に生成するメソッドです。
#     - この例では、`val`, `left`, `right`の3つのインスタンス変数に対してゲッターとセッターが生成されています。

# 3. **`initialize`メソッド**
#     - `initialize`メソッドは、クラスのインスタンスが生成される際に自動的に呼び出されるコンストラクタです。
#     - このメソッドは、3つの引数を取ります：
#         - `val`: ノードの値を表します。デフォルト値は`0`です。
#         - `left`: 左の子ノードを指します。デフォルト値は`nil`です。
#         - `right`: 右の子ノードを指します。デフォルト値は`nil`です。
#     - インスタンスが生成されると、これらの引数がインスタンス変数（`@val`, `@left`, `@right`）に設定されます。

# #### インスタンス変数
# - **`@val`**: ノードの値を保持します。
# - **`@left`**: 左の子ノードを指します。これは`TreeNode`のインスタンスか、子ノードが存在しない場合は`nil`です。
# - **`@right`**: 右の子ノードを指します。これは`TreeNode`のインスタンスか、子ノードが存在しない場合は`nil`です。

# #### 例

# ```ruby
# # 新しいTreeNodeのインスタンスを作成
# node = TreeNode.new(1)

# # 属性にアクセス
# puts node.val   # => 1
# puts node.left  # => nil
# puts node.right # => nil

# # 左右の子ノードを設定
# node.left = TreeNode.new(2)
# node.right = TreeNode.new(3)

# # 子ノードの値にアクセス
# puts node.left.val  # => 2
# puts node.right.val # => 3
# ```

# この例では、`TreeNode`クラスを使用して二分木のノードを作成し、それぞれのノードの値や子ノードにアクセス、設定しています。`attr_accessor`を使うことで、`val`, `left`, `right`のインスタンス変数に対して簡単にアクセスできるようになっています。
