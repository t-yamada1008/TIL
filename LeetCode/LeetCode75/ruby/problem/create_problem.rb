def title_to_snake_case(title)
  # 数字とタイトルを分ける
  number, title_part = title.split(' ', 2)

  # ドットをアンダースコアに変換
  title_part = title_part.gsub('.', '_')

  # タイトルをスペースで分割し、各単語をスネークケースに変換
  snake_case_title = title_part.split(' ').map(&:downcase).join('_')

  # 数字とスネークケースに変換したタイトルを結合し、.rbを追加
  "#{number}_#{snake_case_title}.rb"
end

# テスト
puts title_to_snake_case("000 test code")  # => "000_test_code.rb"

if ARGV.length != 1
  puts "Usage: #{$0} \"<LeetCode problem title>\""
  exit 1
end

title = ARGV[0]
snake_case_title = title_to_snake_case(title)

# ファイル名を作成
file_name = "#{Dir.pwd}/#{snake_case_title}.rb"

File.open(file_name, 'w') do |file|
  file.puts "# #{title}"
  # 改行を入れる
  file.puts
end

puts "Created file: #{file_name}"
