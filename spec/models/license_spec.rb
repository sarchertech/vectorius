require File.dirname(__FILE__) + '/../spec_helper'

module LicenseSpecHelper

  def valid_license_attributes
    {
      :name => 'test_license_name',
      :description => 'test license description'
    }
  end
  
end

describe License do
  
  include LicenseSpecHelper
  
  before(:each) do
    @license = License.new
    @license.attributes = valid_license_attributes
  end
  
  it "should be valid" do
    @license.should be_valid
  end
  
  it "should require name" do
    @license.name = nil
    @license.should have(1).error_on(:name)
  end
  
  it "should require description" do
    @license.description = nil
    @license.should have(1).error_on(:description)
  end
  
  it "should have vectors" do
    lambda { @license.vectors }.should_not raise_error(NoMethodError)
  end
  
end