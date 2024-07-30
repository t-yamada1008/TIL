# 1768. Merge Strings Alternately

# You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. If a string is longer than the other, append the additional letters onto the end of the merged string.
# Return the merged string.

# Example 1:
# Input: word1 = "abc", word2 = "pqr"
# Output: "apbqcr"
# Explanation: The merged string will be merged as so:
# word1:  a   b   c
# word2:    p   q   r
# merged: a p b q c r

# Example 2:
# Input: word1 = "ab", word2 = "pqrs"
# Output: "apbqrs"
# Explanation: Notice that as word2 is longer, "rs" is appended to the end.
# word1:  a   b
# word2:    p   q   r   s
# merged: a p b q   r   s

# Example 3:
# Input: word1 = "abcd", word2 = "pq"
# Output: "apbqcd"
# Explanation: Notice that as word1 is longer, "cd" is appended to the end.
# word1:  a   b   c   d
# word2:    p   q
# merged: a p b q c   d

# Constraints:
# 1 <= word1.length, word2.length <= 100
# word1 and word2 consist of lowercase English letters.

# Code1

# @param {String} word1
# @param {String} word2
# @return {String}
def merge_alternately(word1, word2)
  merged = ''
  i = 0
  while i < word1.length || i < word2.length
    merged += word1[i] if i < word1.length
    merged += word2[i] if i < word2.length
    i += 1
  end
  merged
end

# 初期化:
# merged という空の文字列を作成します。これは最終的にマージされた文字列を保持します。
# i というインデックスを0に初期化します。

# ループ:
# while i < word1.length || i < word2.length:
# word1 または word2 のどちらかの長さが i より大きい限りループを続けます。
# これは、どちらかの文字列がまだ処理されていない文字を持っている限りループを続けることを意味します。

# 文字の追加:
# merged += word1[i] if i < word1.length:
# i が word1 の長さより小さい場合、word1 の現在のインデックスの文字を merged に追加します。
# merged += word2[i] if i < word2.length:
# i が word2 の長さより小さい場合、word2 の現在のインデックスの文字を merged に追加します。

# インデックスのインクリメント:
# i += 1:
# インデックスを1増やします。

# 結果の返却:
# ループが終了した後、マージされた文字列 merged を返します。

# Code2

# @param {String} word1
# @param {String} word2
# @return {String}
def merge_alternately(word1, word2)
  w1 = word1.chars
  w2 = word2.chars

  count = [word1.length, word2.length].max

  result = []
  (0...count).each do |r|
    result << w1[r] if r < w1.length
    result << w2[r] if r < w2.length
  end

  result.join
end

# 修正点

# countの計算:
# countはword1とword2の長さのうち、最大のものに設定します。[word1.length, word2.length].maxを使用します。

# ループの範囲:
# (0..count)ではなく、(0...count)を使用します。(0..count)はcountを含むため、範囲外アクセスが発生します。

# 条件の修正:
# result << w1[r] if r < w1.lengthとresult << w2[r] if r < w2.lengthに修正します。これにより、インデックスが範囲内であることを確認します。

# 結果の結合:
# 最後にresult.joinを使用して、配列を文字列に結合します。

# 例
puts merge_alternately("abc", "pqr") # => "apbqcr"
puts merge_alternately("ab", "pqrs") # => "apbqrs"
puts merge_alternately("abcd", "pq") # => "apbqcd"
