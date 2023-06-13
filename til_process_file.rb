def til_process_file(file_name)
  file = File.read(file_name)

  replacements = {
    /\n+/ => "\n",
    /ChatGPT/ => "\n",
    /User/ => "\n",
    /Copy code/ => "\n",
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
