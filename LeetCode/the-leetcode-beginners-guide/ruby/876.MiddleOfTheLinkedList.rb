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

# このRubyのコードは、単方向連結リストの中央のノードを見つけるためのものです。このアルゴリズムは「トータスとヘア」アルゴリズムとしても知られており、2つのポインタ（`slow`と`fast`）を使用します。`slow`ポインタは一度に1つのノードを進み、`fast`ポインタは一度に2つのノードを進みます。この方法により、`fast`ポインタがリストの終わりに達した時、`slow`ポインタはちょうどリストの中央に位置することになります。
#
# コードの解説:
#
# 1. **ListNodeクラス**: このクラスは、連結リストのノードを表します。各ノードは値(`val`)と次のノードへの参照([`next`](command:_github.copilot.openSymbolFromReferences?%5B%7B%22%24mid%22%3A1%2C%22external%22%3A%22file%3A%2F%2F%2FUsers%2Ftakatoshi%2F.rbenv%2Fversions%2F3.2.1%2Flib%2Fruby%2F3.2.0%2Fracc%2Fgrammar.rb%22%2C%22path%22%3A%22%2FUsers%2Ftakatoshi%2F.rbenv%2Fversions%2F3.2.1%2Flib%2Fruby%2F3.2.0%2Fracc%2Fgrammar.rb%22%2C%22scheme%22%3A%22file%22%7D%2C%7B%22line%22%3A849%2C%22character%22%3A4%7D%5D "../../.rbenv/versions/3.2.1/lib/ruby/3.2.0/racc/grammar.rb"))を持ちます。
#
# 2. **middle_nodeメソッド**: このメソッドは、連結リストの先頭を指す`head`ノードを引数として受け取り、リストの中央のノードを返します。
#
# 3. **アルゴリズムの実行**:
#    - `slow`と`fast`の両方のポインタをリストの先頭に設定します。
#    - `while`ループを使用して、`fast`ポインタがリストの終わりに達するまで、または`fast.next`が`nil`になるまでループを続けます。これは、リストの終わりに達したかどうかを確認するためです。
#    - ループ内で、`slow`ポインタを1つのノード分進め、`fast`ポインタを2つのノード分進めます。
#    - `fast`ポインタがリストの終わりに達した時点で、`slow`ポインタはリストの中央に位置しています。そのため、`slow`を返すことで、リストの中央のノードを取得できます。
#
# このアルゴリズムの美しさは、リストを2回走査する必要がなく、時間計算量がO(n)である点です（nはリストの長さ）。また、追加のメモリを使用せずに中央のノードを見つけることができます。
