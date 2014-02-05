def sekrit_santa( participants )
  participants = participants.split(/, ?/) if participants.is_a? String
  raise TypeError "must be a comma-separated string or an array" unless participants.is_a? Array
  raise "must have unique participants"     if participants.uniq.size != participants.size
  raise "must have at least 3 participants" if participants.size < 3
 
  participants.shuffle!
  output = {}
 
  participants.each_with_index do |participant, index|
    if index == participants.length-1
      output[participant] = participants[0]
    else
      output[participant] = participants[index+1]
    end
  end
  return output.sort_by(&:first)
end