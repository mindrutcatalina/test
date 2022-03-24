f = File.open('input.txt', 'r')
golfer_count = f.readline.to_i
golfers = golfer_count.times.map do
  id, name, club = f.readline.split
  id = id.to_i
  {
    id:,
    name:,
    club:,
  }
end
score_count = f.readline.to_i
scores = score_count.times.map do
  value, golfer_id = f.readline.split.map(&:to_i)
  {
    golfer_id:,
    value:,
  }
end

# SUBTASK 1
# =========
scores_by_golfer_id = scores.group_by { |score| score[:golfer_id] }

golfers.each do |golfer|
  golfer_scores = scores_by_golfer_id[golfer[:id]]
  golfer[:skill] = golfer_scores.sum { |score| score[:value] } / golfer_scores.size
end

golfers_by_club_name = golfers.group_by { |golfer| golfer[:club] }.to_a

def print_club_memberships(golfers_by_club_name)
  golfers_by_club_name = golfers_by_club_name.to_a
  golfers_by_club_name.sort_by! { |club, golfers| -golfers.size }
  golfers_by_club_name.each do |_, golfers|
    golfers.sort_by! { |golfer| -golfer[:skill] }
  end

  golfers_by_club_name.each do |club, golfers|
    golfer_names = golfers.map { |golfer| golfer[:name] }
    puts "#{club}: #{golfer_names.join(' ')}"
  end
end

puts 'Subtask 1'
print_club_memberships(golfers_by_club_name)

# SUBTASK 2
# =========
golfers.sort_by! { |golfer| -golfer[:skill] }
club_count = golfers_by_club_name.size
club_memberships = golfers_by_club_name.map(&:first).each_with_index.to_h do |club, index|
  club_golfers = [ golfers[index] ]
  club_golfers += golfers[club_count..] if index == 0
  [ club, club_golfers ]
end

puts 'Subtask 2'
print_club_memberships(club_memberships)

# SUBTASK 3
# =========
club_memberships = golfers_by_club_name.to_h
weakest_club = club_memberships.min_by { |_, golfers| golfers.first[:skill] }.first
golfer = club_memberships.reject { |club, _| club == weakest_club }
                         .map { |_, golfers| golfers[1] }
                         .max_by { |golfer| golfer[:skill] }
club_memberships[golfer[:club]].delete(golfer)
club_memberships[weakest_club] << golfer
puts 'Subtask 3'
print_club_memberships(club_memberships)
