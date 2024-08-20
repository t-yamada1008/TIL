def title_to_snake_case(title)

  # .を_に変換
  title = title.gsub('.', '_')

  # 数字とタイトルを分ける
  number, title_part = title.split(' ', 2)

  # タイトルをスペースで分割し、各単語をスネークケースに変換
  snake_case_title = title_part.split(' ').map(&:downcase).join('_')

  # 数字とスネークケースに変換したタイトルを結合
  number + snake_case_title
end

# 一旦処理を止めて問題名を入力
puts 'Enter the title of the problem: '
title = gets.chomp

snake_case_title = title_to_snake_case(title)

# ファイル名を作成
file_name = "#{Dir.pwd}/#{snake_case_title}.rb"

File.open(file_name, 'w') do |file|
  file.puts "# #{title}"
  # 改行を入れる
  file.puts
end

puts "Created file: #{file_name}"
