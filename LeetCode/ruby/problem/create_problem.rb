def title_to_snake_case(title)

  # タイトルを変換
  # EX: 605. Can Place Flowers -> 605_can_place_flowers
  title.delete('.').downcase.gsub!(/ /, '_')
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

# ファイルを開く
system("code #{file_name}")
