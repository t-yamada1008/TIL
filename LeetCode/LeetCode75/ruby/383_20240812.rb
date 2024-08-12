# 383. Ransom Note

# Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
# Each letter in magazine can only be used once in ransomNote.

# Example 1:

# Input: ransomNote = "a", magazine = "b"
# Output: false

# Example 2:
# Input: ransomNote = "aa", magazine = "ab"
# Output: false

# Example 3:
# Input: ransomNote = "aa", magazine = "aab"
# Output: true

# Constraints:
# 1 <= ransomNote.length, magazine.length <= 105
# ransomNote and magazine consist of lowercase English letters.

# Code

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  magazine_chars = magazine.chars.tally
  ransom_note.chars.each do |c|
    return false if magazine_chars[c].nil? || magazine_chars[c] == 0
    magazine_chars[c] -= 1
  end
  true
end

# 引数のチェック
if ARGV.length != 2
  puts "Usage: ruby 383_20240812.rb <ransom_note> <magazine>"
  exit 1
end

ransom_note = ARGV[0]
magazine = ARGV[1]

# 結果を表示
puts can_construct(ransom_note, magazine)
