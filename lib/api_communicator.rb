require 'rest-client'
require 'json'
require 'pry'

def characters
  response_arr = []
  9.times.each do |idx|
    system('clear')
    puts 'Downloading characters'.concat('*' * (idx + 1))
    response_string = RestClient.get("http://swapi.dev/api/people/?page=#{idx + 1}")
    response_arr << JSON.parse(response_string)['results']
  end
  response_arr.flatten
end

def get_character_movies_from_api(character_name)
  find_by_char = characters.find do |hash|
    hash["name"].downcase == character_name
  end

  films = []
  find_by_char["films"].each do |filmurl|
    response_string = RestClient.get(filmurl)
    response_hash = JSON.parse(response_string)
    films << response_hash["title"]
  end
  films

  #binding.pry
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  puts films
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
