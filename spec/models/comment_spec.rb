require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module CommentSpecHelper

  def valid_comment_attributes
    {
      :body => 'test comment body'
    }
  end
  
end

describe Comment do
  
  include CommentSpecHelper
  
  before(:each) do
    @comment = Comment.new
    @comment.attributes = valid_comment_attributes
  end

  it "should be valid" do
    @comment.should be_valid
  end
  
  it "should require body" do
    @comment.body = nil
    @comment.should have(1).error_on(:body)
  end
  
  it "should belong to vector" do
    lambda { @comment.vector }.should_not raise_error(NoMethodError)
  end
  
  it "should belong to user" do
    lambda { @comment.user }.should_not raise_error(NoMethodError)
  end
  
  it "should not allow ip to be set with mass assignment" do
    params = valid_comment_attributes.merge({:ip => '1.1.1'})    
    comment = Comment.new(params)
    comment.ip.should_not == '1.1.1'
  end
  
  it "should not allow comment_id to be set with mass assignment"
  
end
