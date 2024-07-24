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
  ransom_note.chars.each do |char|
    return false if magazine.sub!(char, "").nil?
  end
  true
end

# このRuby関数can_constructは、ransom_note文字列がmagazine文字列から構成できるかどうかを判断します。具体的には、ransom_noteの各文字がmagazineに存在し、かつmagazineからその文字を使用した後もransom_noteを構成できるかどうかをチェックします。
#
# パラメータ
# ransom_note: 構成したい文字列。
# magazine: 使用可能な文字が含まれる文字列。
# 戻り値
# Boolean: ransom_noteがmagazineの文字を使って構成できる場合はtrue、そうでない場合はfalseを返します。
# 処理の流れ
# ransom_noteを文字ごとに分解し、charsメソッドで配列に変換します。
# ransom_noteの各文字に対してループを行います。
# magazineからransom_noteの現在の文字を検索し、見つかった場合はその文字をmagazineから削除します。これはsub!メソッドを使って行います。sub!メソッドは、指定した文字列を見つけた場合にそれを第二引数の文字列（この場合は空文字列）に置換し、見つからなかった場合はnilを返します。
# もしmagazineからransom_noteの現在の文字を削除できなかった（つまり、その文字がmagazineに存在しなかった）場合、falseを返して関数を終了します。
# ransom_noteの全ての文字に対して上記の処理を行い、全ての文字がmagazineに存在し、削除も成功した場合、trueを返します。
# 例
# ransom_note = "a", magazine = "b"の場合、magazineにransom_noteを構成するための文字aが存在しないため、falseを返します。
# ransom_note = "aa", magazine = "ab"の場合、最初のaはmagazineから削除できますが、二つ目のaを削除することができないため、falseを返します。
# この関数は、ransom_noteを構成するためにmagazineの文字を一度だけ使用できるというルールを適用しています。
