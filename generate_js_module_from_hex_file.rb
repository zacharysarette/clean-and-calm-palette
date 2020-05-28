#!/urs/bin/env ruby

hash_file = ARGV.first
js_const_file = ARGV.last

@color_bases = ["pistacio", "rose", "lip", "honey", "sand", "emerald", "oribe", "river", "rain"]
@color_values = ["_dark", "_dim", "", "_light", "_faint"]

@lines = []

File.open(hash_file).each do |line|
  formatted_line = line.gsub!(/[^0-9A-Za-z]/, '')
  @lines.push(formatted_line)
end

@formatted_text =  "// Clean and Calm Colors by Zachary Sarette in 2020\n"
@formatted_text <<  "var CleanAndCalmColors = {\n"
@iterator = 0

def makeRow(i, color_value)
  @color_bases.each do | color_base |
    @formatted_text <<  "  #{color_base}#{color_value}: '##{@lines[i]}',\n"
    i += 1
  end
  @iterator = i
end

@color_values.each do |color_value|
  makeRow(@iterator, color_value)
end

@formatted_text << "}\n"
@formatted_text << "export default CleanAndCalmColors\n"

File.open(js_const_file, "w") << @formatted_text

puts "File #{js_const_file} successfully written."

