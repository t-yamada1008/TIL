# 1480. Running Sum of 1d Array
# Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
#
# Return the running sum of nums.

# @param {Integer[]} nums
# @return {Integer[]}

def running_sum(nums)
  sum = 0
  result = []
  nums.each do|num|
      sum = sum + num
      result << sum
  end

  result
end

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

# 別回答
def running_sum(nums)
  (1...nums.length).each do |i|
    nums[i] += nums[i - 1]
  end
  nums
end

# 1480. Running Sum of 1d Arrayは、与えられた1次元配列のランニングサムを計算する問題です。
# ランニングサムとは、配列の各要素に対して、その要素までの全ての要素の合計を計算したものです。

# 問題の説明
# 与えられた配列numsに対して、ランニングサムを計算し、新しい配列を返します。例えば、nums = [1, 2, 3, 4]の場合、ランニングサムは[1, 3, 6, 10]になります。

# 解説
# running_sum関数は、配列numsを引数として受け取り、ランニングサムを計算して返します。
# (1...nums.length).each do |i|は、配列の2番目の要素から最後の要素までをループします。
# nums[i] += nums[i - 1]は、現在の要素に前の要素の値を加えます。これにより、現在の要素はその位置までのランニングサムになります。
# 最終的に、ランニングサムが計算された配列numsを返します。

# 例
# この例では、nums = [1, 2, 3, 4]に対してランニングサムを計算すると、[1, 3, 6, 10]が得られます。各ステップでの計算は以下の通りです：

# nums[1] += nums[0] -> 2 + 1 = 3 -> nums = [1, 3, 3, 4]
# nums[2] += nums[1] -> 3 + 3 = 6 -> nums = [1, 3, 6, 4]
# nums[3] += nums[2] -> 4 + 6 = 10 -> nums = [1, 3, 6, 10]
# このようにして、配列のランニングサムを計算します。
