require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module RatingSpecHelper

  def valid_rating_attributes
    {
      :numerical_rating => 1
    }
  end
  
end

describe Rating do
  
  include RatingSpecHelper
  
  before(:each) do
    @rating = Rating.new
    @rating.attributes = valid_rating_attributes
  end

  it "should be valid" do
    @rating.should be_valid
  end
  
  it "should require numerical_rating" do
    @rating.numerical_rating = nil
    @rating.should have(1).error_on(:numerical_rating)
  end
  
  it "should belong to vector" do
    lambda { @rating.vector }.should_not raise_error(NoMethodError)
  end
  
  it "should not allow ip to be set with mass assignment" do
    params = valid_rating_attributes.merge({:ip => '1.1.1'})    
    rating = Rating.new(params)
    rating.ip.should_not == '1.1.1'
  end
  
end
