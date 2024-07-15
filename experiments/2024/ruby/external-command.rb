require 'open3'

# Running an external command using Open3.capture3
command = 'ls -l'
stdout, stderr, status = Open3.capture3(command)

puts "STDOUT: #{stdout}" # output of the command
puts "STDERR: #{stderr}" # error messages of the command(if any)
puts "STATUS: #{status.exitstatus}" # exit status of the command

# takatoshi@yamadatakatoshinoMacBook-Pro-2 ruby % ruby external-command.rb
# STDOUT: total 40
# -rw-r--r--  1 takatoshi  staff   926  7 15 21:56 built-in.rb
# -rw-r--r--  1 takatoshi  staff   315  7 15 22:21 external-command.rb
# -rw-r--r--  1 takatoshi  staff  3249  7 15 21:34 ketex.md
# -rw-r--r--  1 takatoshi  staff   567  7 15 21:30 ketex.rb
# -rw-r--r--  1 takatoshi  staff   782  7 15 21:44 open3.rb
# STDERR:
# STATUS: 0
