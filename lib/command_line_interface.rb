def welcome
  # puts out a welcome message here!
  puts "Please enter a character name."
end

def get_character_from_user
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
