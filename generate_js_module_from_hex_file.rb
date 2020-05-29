#!/urs/bin/env ruby

require './color_bases_and_values.rb'

hash_file = ARGV.first
js_const_file = ARGV.last

@lines = []

File.open(hash_file).each do |line|
  formatted_line = line.gsub!(/[^0-9A-Za-z]/, '')
  @lines.push(formatted_line)
end

@formatted_text =  "// Clean and Calm Colors by Zachary Sarette in 2020\n"
@formatted_text <<  "var CleanAndCalmColors = {\n"
@iterator = 0

def makeRow(i, color_value)
  ColorBasesAndValues::COLOR_BASES.each do | color_base |
    @formatted_text <<  "  #{color_base}#{color_value}: '##{@lines[i]}',\n"
    i += 1
  end
  @iterator = i
end

ColorBasesAndValues::COLOR_VALUES.each do |color_value|
  makeRow(@iterator, color_value)
end

@formatted_text << "}\n"
@formatted_text << "export default CleanAndCalmColors\n"

File.open(js_const_file, "w") << @formatted_text

puts "File #{js_const_file} successfully written."

