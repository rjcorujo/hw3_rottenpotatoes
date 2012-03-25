require 'spec_helper.rb'

describe Movie do
  
  describe 'find_same_director instance method' do
    it 'should find all movies with same director as a given movie' do
      m1 = Movie.new
      m1.id = "1"
      m1.director = "director dummy"
      m2 = mock('Movie')
      m2.stub(:director).and_return(m1.director)
      m3 = mock('Movie')
      m3.stub(:director).and_return(m1.director)
      fake_movies = [m1,m2,m3]
      Movie.stub(:find).with("1").and_return(m1)
      Movie.stub(:find_all_by_director).with(m1.director).and_return(fake_movies)
      movies = m1.find_same_director
      movies.should == fake_movies
    end
    it 'should return movies without director if the given movie has no director' do
      m1 = Movie.new
      m1.id = "1"
      m2 = mock('Movie')
      m3 = mock('Movie')
      fake_movies = [m1,m2,m3]
      Movie.stub(:find_all_by_director).with(m1.director).and_return(fake_movies)
      movies = m1.find_same_director
      movies.should == fake_movies
    end
  end
    
end
