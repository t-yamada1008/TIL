require 'open3'

# Running a shell command using Open3.capture3
command = 'echo Hello, Open3!'
stdout, stderr, status = Open3.capture3(command)

puts "STDOUT: #{stdout}"
puts "STDERR: #{stderr}"
puts "STATUS: #{status.exitstatus}"

# Running a shell command using Open3.popen3
Open3.popen3('ls -l') do |stdin, stdout, stderr, wait_thr|
  puts "STDOUT: #{stdout.read}"
  puts "STDERR: #{stderr.read}"
  puts "STATUS: #{wait_thr.value.exitstatus}"
end

# takatoshi@yamadatakatoshinoMacBook-Pro-2 ruby % ruby open3.rb
# STDOUT: Hello, Open3!
# STDERR:
# STATUS: 0
# STDOUT: total 24
# -rw-r--r--  1 takatoshi  staff  3249  7 15 21:34 ketex.md
# -rw-r--r--  1 takatoshi  staff   567  7 15 21:30 ketex.rb
# -rw-r--r--  1 takatoshi  staff   450  7 15 21:43 open3.rb
# STDERR:
# STATUS: 0
