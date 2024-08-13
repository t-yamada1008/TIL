def title_to_snake_case(title)
  # 数字とタイトルを分ける
  number, title_part = title.split(' ', 2)

  # タイトルをスペースで分割し、各単語をスネークケースに変換
  snake_case_title = title_part.split(' ').map(&:downcase).join('_')

  # 数字とスネークケースに変換したタイトルを結合
  number + snake_case_title
end

if ARGV.length != 1
  puts "Usage: #{$0} \"<LeetCode problem title>\""
  exit 1
end

title = ARGV[0]
snake_case_title = title_to_camel_case(title)

# ファイル名を作成
file_name = "#{Dir.pwd}/#{snake_case_title}.rb"

File.open(file_name, 'w') do |file|
  file.puts "# #{title}"
  # 改行を入れる
  file.puts
end

puts "Created file: #{file_name}"
