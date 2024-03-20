members = ["A", "B", "C", "D", "E", "F"]

def group_3_3(members)
  group1 = members.sample(3)
  group2 = members - group1
  [group1, group2]
end

def group_2_4(members)
  group1 = members.sample(2)
  group2 = members - group1
  [group1, group2]
end

def make_group(members)
  if rand(2) == 0
    group_3_3(members)
  else
    group_2_4(members)
  end
end

groups = make_group(members)
puts "#{groups[0]}\n#{groups[1]}"
