require 'spec_helper.rb'

describe MoviesController do
  
  describe 'edit movie' do
    it 'should make available the movie to edit view' do
      fake_movie = mock('Movie')
      Movie.stub(:find).with("1").and_return(fake_movie)
      get :edit, {:id => "1"}
      assert_response :success
      assigns(:movie).should == fake_movie
      response.should render_template("edit")
    end
  end
  
  describe 'find movies with same director' do
    it 'should find movies with same director as provided, assign movies and render view' do
      m1 = mock('Movie')
      m2 = mock('Movie')
      m3 = mock('Movie')
      m1.stub(:director).and_return('director dummy')
      m2.stub(:director).and_return('director dummy')
      m3.stub(:director).and_return('director dummy')
      fake_movies = [m1,m2,m3]
      Movie.stub(:find).with("1").and_return(m1)
      m1.stub(:find_same_director).and_return(fake_movies)
      get :find_same_director, {:id => "1"}
      assigns(:movies).should == fake_movies
      response.should render_template("list_results")
    end
    it 'should redirect to home if the given movie has no directors' do
      m1 = mock('Movie')
      m1.stub(:title).and_return("dummy title")
      m1.stub(:director).and_return(nil)
      Movie.stub(:find).with("1").and_return(m1)
      get :find_same_director, {:id => "1"}
      response.should redirect_to(movies_path)
      flash.now[:notice].should_not be_nil
    end
  end
end
