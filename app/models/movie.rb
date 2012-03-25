class Movie < ActiveRecord::Base
  def self.all_ratings_movie
    %w(G PG PG-13 NC-17 R)
  end
  
  def find_same_director
    Movie.find_all_by_director(self.director)
  end
  
end
