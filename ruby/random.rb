# frozen_string_literal: true

members = %w[A B C D E F]
members.shuffle!

num = rand(1..2)
group1 = members[0..num]
group2 = members[(num+1)..5]

puts "#{group1.join(' ')} / #{group2.join(' ')} "
