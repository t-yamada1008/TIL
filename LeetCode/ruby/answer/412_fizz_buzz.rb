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
  (1..n).map do |i|
    if i % 15 == 0
      "FizzBuzz"
    elsif i % 3 == 0
      "Fizz"
    elsif i % 5 == 0
      "Buzz"
    else
      i.to_s
    end
  end
end

# テストケース
puts fizzbuzz(3).inspect  # => ["1", "2", "Fizz"]
puts fizzbuzz(5).inspect  # => ["1", "2", "Fizz", "4", "Buzz"]
puts fizzbuzz(15).inspect # => ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]

# FizzBuzz問題の解決策にはいくつかのアプローチがありますが、最も効率的な方法は、シンプルで読みやすく、かつ計算量が少ない方法です。以下に示すアプローチは、効率的であり、かつ理解しやすいものです。

# アプローチ
# 1. 1からnまでの各数値に対してループを実行します。
# 2. 各数値が15で割り切れる場合は"FizzBuzz"を返します。
# 3. 各数値が3で割り切れる場合は"Fizz"を返します。
# 4. 各数値が5で割り切れる場合は"Buzz"を返します。
# 5. 上記のいずれにも該当しない場合は、その数値を文字列として返します。
# 6. このアプローチは、各数値に対して最大3回の割り算を行うだけなので、計算量はO(n)です。

# 解説
# - 1..nの範囲をmapメソッドでループし、各数値に対して条件をチェックします。
# - i % 15 == 0の条件を最初にチェックすることで、15で割り切れる数値を効率的に処理します。
# - i % 3 == 0およびi % 5 == 0の条件を次にチェックし、それぞれ"Fizz"および"Buzz"を返します。
# - どの条件にも該当しない場合は、数値を文字列に変換して返します。
# この方法はシンプルで効率的であり、FizzBuzz問題を解決するための標準的なアプローチです。

# Stringの初期化について

#このコードでは、String[]を明示的に初期化していませんが、mapメソッドを使用することで暗黙的に初期化されています。
# - mapメソッドは、元の配列の各要素に対してブロックを評価し、その結果を新しい配列として返します。
# - (1..n)は、1からnまでの範囲オブジェクトを生成します。
# - mapメソッドは、この範囲オブジェクトの各要素に対してブロックを評価し、その結果を新しい配列として返します

# つまり、mapメソッドを使用することで、String[]（文字列の配列）が自動的に生成されます。
