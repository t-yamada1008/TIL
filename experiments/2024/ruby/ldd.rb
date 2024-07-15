require 'open3'

command = 'otool -L /bin/ls'
stdout, stderr, status = Open3.capture3(command)

puts "STDOUT: #{stdout}" # output of the command
puts "STDERR: #{stderr}" # error output of the command(if any)
puts "STATUS: #{status.exitstatus}" # exit status of the command
