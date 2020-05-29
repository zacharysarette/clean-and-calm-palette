#!/urs/bin/env ruby

require './color_bases_and_values.rb'

hash_file = ARGV.first
readme_file = ARGV.last

@formatted_text = "# Clean and Calm Palette :art:"
@formatted_text <<  "\n\n> a simple 45 color palette made more readable for the web"
@formatted_text << "\n\n---\n" 
@formatted_text << "## Table Of Contents\n" 
@formatted_text << "* [Colors](#colors)\n" 
@formatted_text << "* [Installation](#installation)\n" 
@formatted_text << "* [Usage](#usage)\n" 
@formatted_text << "---\n" 
@formatted_text << "## Colors\n\n" 
@lines = []

File.open(hash_file).each do |line|
  formatted_line = line.gsub!(/[^0-9A-Za-z]/, '')
  @lines.push(formatted_line)
end

@iterator = 0

def makeRow(i, color_value)
  9.times do 
    @formatted_text <<  "|![#{@lines[i]}](http://via.placeholder.com/50/#{@lines[i]}/000000?text=+)"
    i += 1
  end
  @formatted_text << "|\n"
  9.times do 
    break if @iterator > 0
    @formatted_text <<  "| --- "
  end
  @formatted_text << "|\n" if @iterator == 0
  i = @iterator
  9.times do
    @formatted_text << "|##{@lines[i]}"
    i += 1
  end
  @formatted_text << "|\n"
  ColorBasesAndValues::COLOR_BASES.each do | color_base |
    @formatted_text << "|#{color_base}#{color_value}"
  end
  @formatted_text << "|\n"
  @iterator = i
end

ColorBasesAndValues::COLOR_VALUES.each do |color_value|
  makeRow(@iterator, color_value)
end

@formatted_text << "\n---\n\n"

@formatted_text << "## Installation\n"

@formatted_text << "```\n"
@formatted_text << "npm install clean-and-calm-palette\n"
@formatted_text << "```\n"
@formatted_text << "---\n\n"
@formatted_text << "## Usage\n"
@formatted_text << "```js\n"
@formatted_text << "import cleanAndCalmColors from 'clean-and-calm-palette'\n"
@formatted_text << "console.log(cleanAndCalmColors.river) // '#2998d4'\n"
@formatted_text << "```\n"


File.open(readme_file, "w") << @formatted_text

puts "File #{readme_file} successfully written."

