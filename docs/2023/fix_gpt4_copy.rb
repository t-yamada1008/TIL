def til_process_file(file_name)
  file = File.read(file_name)

  replacements = {
    # 文字列後の改行までを含めるように修正
    /ChatGPT\n/ => "",
    /User\n/ => "",
    /Copy code\n/ => "",
    # 改行削除は最後に一括
    /\n+/ => "\n",
    # ケースバイケースのためにコメントアウト
    # /bash/ => "```bash\n"
  }

  replacements.each do |pattern, replacement|
    file.gsub!(pattern, replacement)
  end

  File.write(file_name, file)
end

filename = ARGV[0]
til_process_file(filename)
