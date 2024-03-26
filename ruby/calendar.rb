# frozen_string_literal: true

require 'date'
require 'optparse'

option = {}
opt = OptionParser.new
opt.on('-m MONTH', Integer) do |month|
  option[:month] = month
end
opt.parse!(ARGV)

if option[:month] && (option[:month] < 1 || option[:month] > 12)
  puts "#{option[:month]} is neither a month number (1..12) nor a name"
  exit
end

year = Date.today.year
month = option[:month] || Date.today.month
first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

puts "#{year}年 #{month}月".center(20)
puts '月 火 水 木 金 土 日'

print '   ' * ((first_day.wday + 6) % 7)

(first_day..last_day).each do |day|
  day = if day.sunday?
          "#{day.day.to_s.rjust(2)}\n"
        else
          "#{day.day.to_s.rjust(2)} "
        end
  print day
end
