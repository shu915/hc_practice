# frozen_string_literal: true

members = %w[A B C D E F]
members.shuffle!

if rand(2) == 1
  group1 = members[0..1]
  group2 = members[2..5]
else
  group1 = members[0..2]
  group2 = members[3..5]
end

puts "#{group1.join(' ')} / #{group2.join(' ')} "
