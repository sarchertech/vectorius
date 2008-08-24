require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubCategory do
  before(:each) do
    @sub_category = SubCategory.new
  end

  it "should be valid" do
    @sub_category.should be_valid
  end
  
  it "should belong to primary_category" do
    lambda { @sub_category.primary_category }.should_not raise_error(NoMethodError)
  end
  
  it "should belong to secondary_category" do
    lambda { @sub_category.secondary_category }.should_not raise_error(NoMethodError)
  end
  
  it "should have vectors" do
    lambda { @sub_category.vectors }.should_not raise_error(NoMethodError)
  end
  
end
