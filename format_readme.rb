#!/urs/bin/env ruby

hash_file = ARGV.first
readme_file = ARGV.last

formatted_text = "# Clean and Calm Palette :art:"
formatted_text <<  "\n\n> a simple 45 color palette made more readable for the web"
formatted_text << "\n\n---" 

File.open(hash_file).each do |line|
  formatted_line = line.gsub!(/[^0-9A-Za-z]/, '')
  formatted_text <<  "\n|![#{formatted_line}](http://via.placeholder.com/50/#{formatted_line}/000000?text=+)|"
  formatted_text << "\n| --- |"
  formatted_text << "\n|'#{formatted_line}'|"
end

formatted_text << "\n---"

File.open(readme_file, "w") << formatted_text

