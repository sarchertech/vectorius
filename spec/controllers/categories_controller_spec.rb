require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CategoriesController, "#route_for" do
  
  it "should map { :controller => 'categories', :action => 'index' } to /categories" do
    route_for(:controller => "categories", :action => "index").should == "/categories"
  end
  
  it "should map { :controller => 'categories', :action => 'new' } to /categories/new" do
    route_for(:controller => "categories", :action => "new").should == "/categories/new"
  end
  
  it "should map { :controller => 'categories', :action => 'create' } to /categories" do
    route_for(:controller => "categories", :action => "create").should == "/categories"
  end
  
  it "should map { :controller => 'categories', :action => 'show', :id => 1 } to /categories/1" do
    route_for(:controller => "categories", :action => "show", :id => 1).should == "/categories/1"
  end
  
  it "should map { :controller => 'categories', :action => 'edit', :id => 1 } to /categories/1/edit" do
    route_for(:controller => "categories", :action => "edit", :id => 1).should == "/categories/1/edit"
  end
  
  it "should map { :controller => 'categories', :action => 'update', :id => 1} to /categories/1" do
    route_for(:controller => "categories", :action => "update", :id => 1).should == "/categories/1"
  end
  
  it "should map { :controller => 'categories', :action => 'destroy', :id => 1} to /categories/1" do
    route_for(:controller => "categories", :action => "destroy", :id => 1).should == "/categories/1"
  end
  
end

describe CategoriesController, "handling GET /categories - index" do

  before(:each) do
    @category = mock_model(Category)
    Category.stub!(:find).and_return([@category])
  end

  def do_index
    get :index
  end
  
  it "should be successful" do
    do_index
    response.should be_success
  end
  
  it "should find all categories" do
    Category.should_receive(:find).with(:all)
    do_index
  end
  
  it "should assign categories for the view" do
    do_index
    assigns[:categories].should == [@category]
  end
  
  it "should render index template" do
    do_index
    response.should render_template('index')
  end
  
end

describe CategoriesController, "handling GET /categories/new - new" do
  
  before(:each) do
    @category = mock_model(Category)
    Category.stub!(:new).and_return(@category)
  end
  
  def do_new
    get :new
  end
  
  it "should be successful" do
    do_new
    response.should be_success
  end
  
  it "should call a new category with no arguments" do
    Category.should_receive(:new).with(no_args())
    do_new
  end
  
  it "should assign a new category for the view" do
    do_new
    assigns[:category].should == @category
  end
  
  it "should render new template" do
    do_new
    response.should render_template('new')
  end
  
end

describe CategoriesController, "handling POST /categories" do
  
  before(:each) do
    @category = mock_model(Category, :to_param => '1', :save => true)
    Category.stub!(:new).and_return(@category)
    @params = { :name => 'test_category_name' }
    @params_for_mock_category = @params.collect
  end
  
  def do_create
    post :create, :category => @params
  end
  
  it "should be successful" do
    do_create
    response.should be_success
  end
  
  it "should call a new category" do
    Category.should_receive(:new).with(@params.stringify_keys)
    do_create
  end
  
end


































