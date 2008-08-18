require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module UserSpecHelper

  def valid_user_attributes
    {
      :name => 'test_user_name',
      :email => 'user@test.com',
      :url => 'www.user_url.com',
      :bio => 'test user biography'
    }
  end
  
end

describe User do
  
  include UserSpecHelper
  
  before(:each) do
    @user = User.new
    @user.attributes = valid_user_attributes
  end

  it "should be valid" do
    @user.should be_valid
  end
  
  it "should require name" do
    @user.name = nil
    @user.should have(1).error_on(:name)
  end
  
  it "should require a unique name" do
    @user.save
    @user2 = User.new
    @user2.attributes = valid_user_attributes
    @user2.should have(1).error_on(:name)
  end
  
  it "should require an email" do
    @user.email = nil
    @user.should have(1).error_on(:email)
  end
  
  it "should create a permalink from a name before_validation" do
    @user.valid?
    @user.permalink.should == (@user.name.downcase.gsub(/[^[:alnum:]]/,'-')).gsub(/-{2,}/,'-')
  end
  
  it "should not allow admin to be set with mass assignment" do
    params = valid_user_attributes.merge({:admin => true})    
    user = User.new(params)
    user.admin.should_not == true
  end
  
  it "should not allow ip to be set with mass assignment" do
    params = valid_user_attributes.merge({:ip => '1.1.1'})    
    user = User.new(params)
    user.ip.should_not == '1.1.1'
  end
  
  it "should not allow vector_ids to be set with mass assignment" do
    @vector = Vector.new
    @vector.id = 1
    Vector.stub!(:find).and_return([@vector])
    params = valid_user_attributes.merge({:vector_ids => [1]})
    user = User.new(params)
    user.vector_ids.should_not == [1]
  end
  
  it "should not allow comment_ids to be set with mass assignment" do
    @comment = Vector.new
    @comment.id = 1
    Comment.stub!(:find).and_return([@comment])
    params = valid_user_attributes.merge({:comment_ids => [1]})
    user = User.new(params)
    user.comment_ids.should_not == [1]
  end
  
  it "should have vectors" do
    lambda { @user.vectors }.should_not raise_error(NoMethodError)
  end
  
  it "should have comments" do
    lambda { @user.comments }.should_not raise_error(NoMethodError)
  end
  
end

describe User, ".to_param" do
  
  include UserSpecHelper
  
  it "should return id-permalink" do
    @user = User.new
    @user.attributes = valid_user_attributes
    @user.id = 1
    @user.valid?
    @user.to_param.should == "#{@user.id}-#{@user.permalink}"
  end

end
