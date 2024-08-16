# 概要:
# 問題ディレクトリ内のファイル名から数字を抽出し、新しいファイルを作成するスクリプト

require 'time'

# 問題ディレクトリのパスを取得
problem_dir = "#{Dir.pwd}/problem"

# 問題ディレクトリ内のファイルを取得
problem_files = Dir.glob("#{problem_dir}/*")

# 問題ディレクトリ内のファイル名を標準出力に出力し、一度入力を待つ
problem_files.each { |file| puts File.basename(file) }
puts "Enter the number of the problem you want to practice:"
problem_number = gets.chomp

# 引数の数字と問題ディレクトリの数字を比較し、一致するファイルパスを取得
## 異なる場合はエラーを出力
problem_file = problem_files.find { |file| file.match?(/#{problem_number}/) }

# ファイルパスから新しいファイル名を作成
# ex: TIL/LeetCode/ruby/problem/383_ransom_note.rb -> 20240812_ransom_note.rb
new_file_name = "#{Time.now.strftime('%Y%m%d')}_#{File.basename(problem_file)}"
new_file_path = "#{Dir.pwd}/practice/#{new_file_name}"

# ファイルの中身を読み込む
problem_code = File.read(problem_file)

# ファイル作成
File.open(new_file_path, 'w') do |file|
  # 問題のコードを書き込む
  file.puts problem_code
  # 改行を入れる
  file.puts
end

puts "Created file: #{new_file_path}"

# テストケースを作成
test_code = <<~TEST
  # assert メソッドの定義
  def assert(actual, expected)
    if actual == expected
      puts "Test passed"
    else
      puts "Test failed: expected \#{expected}, got \#{actual}"
    end
  end

  # test
  testcases = [
    {actual: '', expected: ''},
    {actual: '', expected: ''},
    {actual: '', expected: ''}
  ]

  testcases.each do |testcase|
    assert(sample_function(testcase[:actual], testcase[:expected]))
  end
TEST

# ファイルにテストケースを書き込む
File.open(new_file_path, 'a') do |file|
  file.puts test_code
  # 改行を入れる
  file.puts
end

# ファイルを開く
system("code #{new_file_path}")
