require 'open3'

command = 'file /bin/ls'
stdout, stderr, status = Open3.capture3(command)

puts "STDOUT: #{stdout}" # output of the command
puts "STDERR: #{stderr}" # error output of the command(if any)
puts "STATUS: #{status.exitstatus}" # exit status of the command

# takatoshi@yamadatakatoshinoMacBook-Pro-2 ruby % ruby elf.rb
# STDOUT: /bin/ls: Mach-O universal binary with 2 architectures: [x86_64:Mach-O 64-bit executable x86_64] [arm64e:Mach-O 64-bit executable arm64e]
# /bin/ls (for architecture x86_64):	Mach-O 64-bit executable x86_64
# /bin/ls (for architecture arm64e):	Mach-O 64-bit executable arm64e
# STDERR:
# STATUS: 0
