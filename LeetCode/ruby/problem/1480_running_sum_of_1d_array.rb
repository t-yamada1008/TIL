# 1480. Running Sum of 1d Array
# Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
# Return the running sum of nums.

# Example 1:
#
# Input: nums = [1,2,3,4]
# Output: [1,3,6,10]
# Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
# Example 2:
#
# Input: nums = [1,1,1,1,1]
# Output: [1,2,3,4,5]
# Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
# Example 3:
#
# Input: nums = [3,1,2,10,1]
# Output: [3,4,6,16,17]
#
#
# Constraints:
#
# 1 <= nums.length <= 1000
# -10^6 <= nums[i] <= 10^6

# Code

# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  sum = 0
  nums.map { |num| sum += num }
end


# 1480. Running Sum of 1d Arrayは、与えられた1次元配列のランニングサムを計算する問題です。
# ランニングサムとは、配列の各要素に対して、その要素までの全ての要素の合計を計算したものです。

# 問題の説明
# 与えられた配列numsに対して、ランニングサムを計算し、新しい配列を返します。例えば、nums = [1, 2, 3, 4]の場合、ランニングサムは[1, 3, 6, 10]になります。

# 解説

# 1. sum = 0:
# - sum変数を初期化します。この変数はランニングサムを保持します。

# 2. nums.map { |num| sum += num }:
# - mapメソッドを使って、各要素に対してランニングサムを計算します。
# - 各要素numに対して、sumにその値を加え、sumの新しい値を返します。
# - これにより、元の配列の各要素に対してランニングサムが計算された新しい配列が得られます。
