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
end

# testcaseを作成
testcases = [
  {actual: , expected: },
  {actual: , expected: },
  {actual: , expected: }
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
  assert(sample_function(testcase[:actual]), testcase[:expected])
end
