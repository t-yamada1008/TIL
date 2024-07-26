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

# 2236. Root Equals Sum of Childrenの問題は、与えられた二分木のルートノードの値が、その左右の子ノードの値の合計と等しいかどうかを確認するものです。

# 問題の説明
# - 二分木のルートノードが与えられます。
# - ルートノードの値が、その左子ノードと右子ノードの値の合計と等しいかどうかを判定します。

# 制約
# - 二分木はルートノードとその左右の子ノードのみを含みます。
# - 各ノードの値は整数です。

# 解説
# 1. TreeNodeクラスの定義:

# - TreeNodeクラスは、二分木のノードを表します。
# - 各ノードは、値val、左子ノードleft、右子ノードrightを持ちます。
# - initializeメソッドでノードを初期化します。

# 2. check_treeメソッド:

# - check_treeメソッドは、ルートノードrootを引数として受け取り、ブール値を返します。
# - root.val == root.left.val + root.right.val:
# - ルートノードの値root.valが、左子ノードの値root.left.valと右子ノードの値root.right.valの合計と等しいかどうかを確認します。
# - ? true : false:
# - 条件が真ならtrueを返し、偽ならfalseを返します。

# 例
# 例えば、以下のような二分木が与えられた場合：
#   10
#  /  \
# 4    6

# ルートノードの値は10です。
# 左子ノードの値は4、右子ノードの値は6です。
# 4 + 6 = 10なので、check_treeメソッドはtrueを返します。
# このコードは、与えられた二分木のルートノードの値が、その左右の子ノードの値の合計と等しいかどうかを効率的に確認します。
