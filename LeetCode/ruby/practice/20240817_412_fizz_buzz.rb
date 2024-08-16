# 412. Fizz Buzz

# Given an integer n, return a string array answer (1-indexed) where:

# answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
# answer[i] == "Fizz" if i is divisible by 3.
# answer[i] == "Buzz" if i is divisible by 5.
# answer[i] == i (as a string) if none of the above conditions are true.

# Example 1:
# Input: n = 3
# Output: ["1","2","Fizz"]

# Example 2:

# Input: n = 5
# Output: ["1","2","Fizz","4","Buzz"]
# Example 3:

# Input: n = 15
# Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

# Constraints:
# 1 <= n <= 104

# Code

# @param {Integer} n
# @return {String[]}
def fizzbuzz(n)
  (1..n).map do |index|
    if index % 15 == 0
      'FizzBuzz'
    elsif index % 5 == 0
      'Buzz'
    elsif index % 3 == 0
      'Fizz'
    else
      index.to_s
    end
  end
end

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
  {actual: 3, expected:["1","2","Fizz"] },
  {actual: 5, expected: ["1","2","Fizz","4","Buzz"]},
  {actual: 15, expected: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]}
]

testcases.each do |testcase|
  assert(fizzbuzz(testcase[:actual]), testcase[:expected])
end
