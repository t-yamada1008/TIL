def til_process_file(file_name)
  file = File.read(file_name)
  file.gsub!(/\n+/, "")
  file.gsub!(/ChatGPT/, "\n")
  file.gsub!(/User/, "\n")
  file.gsub!(/Copy code/, "\n")
  file.gsub!(/bash/, "```bash\n")

  File.write(file_name, file)
end

file_name = ARGV[0]
til_process_file(file_name)
