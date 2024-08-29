# 283. Move Zeroes

# Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
# Note that you must do this in-place without making a copy of the array.

# Example 1:
# - Input: nums = [0,1,0,3,12]
# - Output: [1,3,12,0,0]

# Example 2:
# - Input: nums = [0]
# - Output: [0]

# Constraints:
# - 1 <= nums.length <= 104
# - -231 <= nums[i] <= 231 - 1

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  # numsから0の数を取得
  zero_count = nums.count(0)
  # numsから0を削除
  nums.delete(0)
  # numsの末尾にzero_count個の0を追加
  zero_count.times { nums.push(0) }
  # numsを返す
  nums
end

# testcaseを作成
testcases = [
  {actual: [0,1,0,3,12], expected: [1,3,12,0,0]},
  {actual: [0], expected: [0]},
]

# assertメソッドの定義
def assert(actual, expected)
  if actual == expected
    puts "Test passed"
  else
    puts "Test failed: expected #{expected}, got #{actual}"
  end
end

# テストケースを実行
testcases.each do |testcase|
  assert(move_zeroes(testcase[:actual]), testcase[:expected])
end
