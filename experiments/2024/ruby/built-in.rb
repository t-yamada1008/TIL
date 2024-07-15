require 'open3'

def built_in_command?(command)
  stdout, stderr, status = Open3.capture3("type #{command}")
  puts "Open3.capture3(\"type #{command}\")"
  puts Open3.capture3("type #{command}")
  puts "STDOUT: #{stdout}"
  puts "STDERR: #{stderr}"
  puts "STATUS: #{status.exitstatus}"
  !stdout.include?("is /")
end

commands = ["cd", "ls", "echo", "pwd"]
commands.each do |command|
  if built_in_command?(command)
    puts "#{command} is a built-in command."
  else
    puts "#{command} is not a built-in command."
  end
end

# takatoshi@yamadatakatoshinoMacBook-Pro-2 ruby % ruby built-in.rb
# STDOUT: cd is a shell builtin
# STDERR:
# STATUS: 0
# cd is a built-in command.
# STDOUT: ls is /bin/ls
# STDERR:
# STATUS: 0
# ls is not a built-in command.
# STDOUT: echo is a shell builtin
# STDERR:
# STATUS: 0
# echo is a built-in command.
# STDOUT: pwd is a shell builtin
# STDERR:
# STATUS: 0
# pwd is a built-in command.
