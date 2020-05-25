#!/urs/bin/env ruby

hash_file = ARGV.first
readme_file = ARGV.last

@formatted_text = "# Clean and Calm Palette :art:"
@formatted_text <<  "\n\n> a simple 45 color palette made more readable for the web"
@formatted_text << "\n\n---\n" 
@lines = []

File.open(hash_file).each do |line|
  formatted_line = line.gsub!(/[^0-9A-Za-z]/, '')
  @lines.push(formatted_line)
end

@iterator = 0

def makeRow(i)
  9.times do 
    @formatted_text <<  "|![#{@lines[i]}](http://via.placeholder.com/50/#{@lines[i]}/000000?text=+)"
    i += 1
  end
  @formatted_text << "|\n"
  9.times do 
    @formatted_text << "| --- "
  end
  @formatted_text << "|\n"
  i = @iterator
  9.times do
    @formatted_text << "|'#{@lines[i]}'"
    i += 1
  end
  @formatted_text << "|\n"
  @iterator = i
end

5.times do
  makeRow(@iterator)
  @formatted_text << "\n"
end

@formatted_text << "\n---"

File.open(readme_file, "w") << @formatted_text

