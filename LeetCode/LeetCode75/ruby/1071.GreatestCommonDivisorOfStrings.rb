# 1071. Greatest Common Divisor of Strings

# For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).
# Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

# Example 1:
# Input: str1 = "ABCABC", str2 = "ABC"
# Output: "ABC"
# Example 2:

# Input: str1 = "ABABAB", str2 = "ABAB"
# Output: "AB"
# Example 3:

# Input: str1 = "LEET", str2 = "CODE"
# Output: ""

# Constraints:
# 1 <= str1.length, str2.length <= 1000
# str1 and str2 consist of English uppercase letters.

# Code

# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings(str1, str2)
  # もし str1 + str2 が str2 + str1 と等しくない場合、共通のパターンは存在しない
  return "" if str1 + str2 != str2 + str1

  # 文字列の長さの最大公約数を求め、その長さまでの部分文字列を返す
  gcd_length = gcd(str1.length, str2.length)
  str1[0...gcd_length]
end

# 最大公約数を求めるためのヘルパーメソッド
def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end
