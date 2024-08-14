# 876. Middle of the Linked List

# Given the head of a singly linked list, return the middle node of the linked list.
# If there are two middle nodes, return the second middle node.

# Example 1:
# Input: head = [1,2,3,4,5]
# Output: [3,4,5]
# Explanation: The middle node of the list is node 3.

# Example 2:
# Input: head = [1,2,3,4,5,6]
# Output: [4,5,6]
# Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.

# Constraints:
# The number of nodes in the list is in the range [1, 100].
# 1 <= Node.val <= 100

# Code

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next

    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @return {ListNode}
def middle_node(head)
  slow = head
  fast = head

  while fast != nil && fast.next != nil
    slow = slow.next
    fast = fast.next.next
  end
  slow
end

# 876. Middle of the Linked Listは、単方向連結リストの中央のノードを見つけるためのものです。

# このアルゴリズムは「ウサギとカメ」アルゴリズムとしても知られており、2つのポインタ（`slow`と`fast`）を使用します。
# `slow`ポインタは一度に1つのノードを進み、`fast`ポインタは一度に2つのノードを進みます。
# この方法により、`fast`ポインタがリストの終わりに達した時、`slow`ポインタはちょうどリストの中央に位置することになります。
# このアルゴリズムの美しさは、リストを2回走査する必要がなく、時間計算量がO(n)である点です（nはリストの長さ）。
# また、追加のメモリを使用せずに中央のノードを見つけることができます。

# アプローチ
# 1. slowポインタとfastポインタの2つを初期化します。両方ともリンクリストの先頭（head）を指します。
# 2. fastポインタは2ステップずつ進み、slowポインタは1ステップずつ進みます。
# 3. fastポインタがリストの末尾に到達するか、fastポインタの次のノードが存在しない場合、slowポインタはリストの中央のノードを指しています。

# 解説
# - ListNodeクラスは、リンクリストのノードを定義します。各ノードは値（val）と次のノードへのポインタ（next）を持ちます。
# - middle_node関数は、リンクリストの先頭ノード（head）を引数として受け取り、中央のノードを返します。
# - slowポインタとfastポインタを初期化し、両方ともheadを指します。
# - whileループ内で、fastポインタがリストの末尾に到達するまで、slowポインタを1ステップ、fastポインタを2ステップ進めます。
# - fastポインタがリストの末尾に到達した時点で、slowポインタはリストの中央のノードを指しています。

# 例
# リンクリストの作成
# node5 = ListNode.new(5)
# node4 = ListNode.new(4, node5)
# node3 = ListNode.new(3, node4)
# node2 = ListNode.new(2, node3)
# head = ListNode.new(1, node2)

# # 中央のノードを見つける
# middle = middle_node(head)
# puts middle.val  # => 3

# この例では、リンクリスト1 -> 2 -> 3 -> 4 -> 5の中央のノードは3です。
# middle_node関数を使用して、このノードを見つけることができます。

# assert メソッドの定義
def assert(actual, expected)
  if actual == expected
    puts "Test passed"
  else
    puts "Test failed: expected #{expected}, got #{actual}"
  end
end

# test
testcases = [
  {actual: 'sample_actual1', expected: 'sample_expected1'},
  {actual: 'sample_actual2', expected: 'sample_expected2'},
  {actual: 'sample_actual3', expected: 'sample_expected3'}
]

testcases.each do |testcase|
  assert(sample_function(testcase[:actual], testcase[:expected]))
end
