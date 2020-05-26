#!/urs/bin/env ruby

todo_file = ARGV.first
readme_file = ARGV.last

File.open(readme_file, "a") do |readme_file|
  readme_file << "\n"
  readme_file << File.read(todo_file)
end

puts "File #{todo_file} successfully appended to README."

