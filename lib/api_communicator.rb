require 'rest-client'
require 'json'
require 'pry'

# iterate over the character hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `parse_character_movies`
#  and that method will do some nice presentation stuff: puts out a list
#  of movies by title. play around with puts out other info about a given film.

def get_character_movies_from_api(character)
  #make the web request
  movies = []
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash.each do |key, value|
    if key == "results"
      value.each do |keys|
        keys.each do |stats, info|
          binding.pry
          if info == character
            movies << character_hash["results"][0]["films"]
          end
        end
      end
    end
  end
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  titles = RestClient.get('http://www.swapi.co/api/films/')
  titles_hash = JSON.parse(titles)
  titles_hash.each do |key, value|


end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)

end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
