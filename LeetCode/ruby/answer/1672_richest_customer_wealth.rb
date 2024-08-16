# 1672. Richest Customer Wealth
#
# You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank.
# Return the wealth that the richest customer has.
# A customer's wealth is the amount of money they have in all their bank accounts.
# The richest customer is the customer that has the maximum wealth.

# Example 1:
# Input: accounts = [[1,2,3],[3,2,1]]
# Output: 6

# Explanation:
# 1st customer has wealth = 1 + 2 + 3 = 6
# 2nd customer has wealth = 3 + 2 + 1 = 6
# Both customers are considered the richest with a wealth of 6 each, so return 6.

# Example 2:
# Input: accounts = [[1,5],[7,3],[3,5]]
# Output: 10

# Explanation:
# 1st customer has wealth = 6
# 2nd customer has wealth = 10
# 3rd customer has wealth = 8
# The 2nd customer is the richest with a wealth of 10.

# Example 3:
# Input: accounts = [[2,8,7],[7,1,3],[1,9,5]]
# Output: 17

# Constraints:
# m == accounts.length
# n == accounts[i].length
# 1 <= m, n <= 50
# 1 <= accounts[i][j] <= 100

# Code

# @param {Integer[][]} accounts
# @return {Integer}

def maximum_wealth(accounts)
  accounts.map { |account| account.sum }.max
end

# 1672. Richest Customer Wealthの問題は、複数の顧客の銀行口座の資産を表す2次元配列が与えられたとき、最も裕福な顧客の資産を求めるものです。
# 各顧客の資産は、その顧客が持つすべての口座の資産の合計です。

# 制約
# - m == accounts.length（顧客の数）
# - n == accounts[i].length（各顧客が持つ口座の数）
# - 1 <= m, n <= 50
# - 1 <= accounts[i][j] <= 100（各口座の資産）

# 解説
# 1. accounts.map { |account| account.sum }:
# - accountsは2次元配列で、各要素は顧客の口座の資産を表す配列です。
# - mapメソッドを使って、各顧客の口座の資産の合計を計算します。
# - account.sumは、各顧客の口座の資産の合計を計算します。
# - この結果、各顧客の総資産を含む1次元配列が得られます。

# 2. .max:
# - mapメソッドの結果として得られた1次元配列から、最大値を取得します。
# - これが最も裕福な顧客の資産となります。

# 例
# 例えば、accounts = [[1, 2, 3], [3, 2, 1], [4, 5, 6]]の場合：

# - mapメソッドで各顧客の資産の合計を計算すると、[6, 6, 15]が得られます。
# - maxメソッドでこの配列の最大値を取得すると、15が得られます。
# このコードは、与えられた2次元配列から最も裕福な顧客の資産を効率的に計算します。
