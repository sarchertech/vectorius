require File.dirname(__FILE__) + '/../spec_helper'

module VectorSpecHelper

  def valid_vector_attributes
    {
      :name => 'test_vector_name'
    }
  end
  
end

describe Vector do
  
  include VectorSpecHelper
  
  before(:each) do
    @vector = Vector.new
    @vector.attributes = valid_vector_attributes
  end
  
  it "should be valid" do
    @vector.should be_valid
  end
  
  it "should require a name" do
    @vector.name = nil
    @vector.should have(1).error_on(:name)
  end
  
  it "should require a unique name" do
    @vector.save
    @vector2 = Vector.new
    @vector2.attributes = valid_vector_attributes
    @vector2.should have(1).error_on(:name)
  end
  
  it "should create a permalink from a name before_validation" do
    @vector.valid?
    @vector.permalink.should == (@vector.name.downcase.gsub(/[^[:alnum:]]/,'-')).gsub(/-{2,}/,'-')
  end
  
end

describe Vector, ".to_param" do
  
  include VectorSpecHelper
  
  it "should return id-permalink" do
    @vector = Vector.new(:id => 1)
    @vector.attributes = valid_vector_attributes
    @vector.valid?
    @vector.to_param.should == "#{@vector.id}-#{@vector.permalink}"
  end

end

























