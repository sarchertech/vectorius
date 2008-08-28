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

describe SubCategory, ".sub_category_assigner (class method)" do
  
  it "should exist" do
    SubCategory.should respond_to(:sub_category_assigner)
  end
  
  it "should find or create sub_cats to match combinations and assign to vector" do
    @cat_id_array = [1, 2]
    @vector = Vector.create(:name => 'test_vector_name')
    @sub_cat1 = SubCategory.create(:primary_category_id => 1,
                                   :secondary_category_id => 2)
    @sub_cat2 = SubCategory.create(:primary_category_id => 2,
                                   :secondary_category_id => 1)
    SubCategory.should_receive(
      :find_or_create_by_primary_category_id_and_secondary_category_id
      ).with(1, 2).and_return(@sub_cat1)
    SubCategory.should_receive(
      :find_or_create_by_primary_category_id_and_secondary_category_id
      ).with(2, 1).and_return(@sub_cat2)  
    SubCategory.sub_category_assigner(@cat_id_array, @vector)
    @sub_cat1.vectors[0].should == @vector
    @sub_cat2.vectors[0].should == @vector
  end
  
end













