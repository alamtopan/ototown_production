class Backend::CategoriesController < Backend::ApplicationController
  defaults :resource_class => Category, :collection_name => 'categories', :instance_name => 'category'

  def index
    @categories = Category.page(params[:page])  
  end
end