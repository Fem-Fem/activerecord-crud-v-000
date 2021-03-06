# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end
require 'pry'

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

def can_be_created_in_a_block
  Movie.create do |m|
    m.title = "Home Alone"
    m.release_date = 1990
  end
end

def can_get_the_first_item_in_the_database
  movie = Movie.first.title
end

def can_get_the_last_item_in_the_database
  movie = Movie.last.title
end

def can_get_size_of_the_database
  movie_size = Movie.count
end

def can_find_the_first_item_from_the_database_using_id
  movie = Movie.find(1).title
end

def can_find_by_multiple_attributes
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  Movie.find_by("title = 'Title' AND release_date = 2000 AND director = 'Me'")
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  Movie.where("release_date > 2002").order(release_date: :desc)
end

def can_be_found_updated_and_saved(old_title = "Awesome Flick", updated_title = "Even Awesomer Flick")
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  Movie.create(title: old_title)
  movie = Movie.find_by title: old_title
  movie.title = updated_title
  movie.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  Movie.update((Movie.find_by title: "Wat?").id, title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.update_all( "title = 'A Movie'" )
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  movie = Movie.find_by title: "That One Where the Guy Kicks Another Guy Once"
  Movie.delete(movie.id)
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.delete_all
end
