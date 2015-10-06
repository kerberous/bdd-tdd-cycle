class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :description, :release_date, :director

  def self.find_by_same_dir(movie)
    Movie.find_all_by_director(movie.director)
  end

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end

