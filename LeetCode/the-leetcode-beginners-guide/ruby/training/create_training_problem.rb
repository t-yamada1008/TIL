# 練習用のLeetCodeの問題を作成するスクリプト

# 引数に問題の数字を取る
# 問題の数字と現在の日付を結合してファイル名を作成

if ARGV.length != 1
  puts "Usage: #{$0} \"<LeetCode problem title>\""
  exit 1
end

title = ARGV[0].to_s + "_" + Time.now.strftime("%Y%m%d")
file_name = "#{Dir.pwd}/#{title}.rb"

File.open(file_name, 'w') do |file|
  file.puts "# #{title}"
  file.puts
end
