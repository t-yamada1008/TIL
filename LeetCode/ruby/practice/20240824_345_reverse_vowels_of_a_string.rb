# # 345. Reverse Vowels of a String
#
# # Given a string s, reverse only all the vowels in the string and return it.
# # The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
#
# ## Example 1:
# - Input: s = "hello"
# - Output: "holle"
#
# ## Example 2:
# - Input: s = "leetcode"
# - Output: "leotcede"
#
# ## Constraints:
# - 1 <= s.length <= 3 * 105
# - s consist of printable ASCII characters.

# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels = s.scan(/[aeiou]/i)
  s.gsub(/[aeiou]/i) { vowels.pop }
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
  assert(sample_function(testcase[:actual], testcase[:expected]))
end
