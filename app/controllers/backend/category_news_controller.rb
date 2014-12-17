class Backend::CategoryNewsController < Backend::ApplicationController
  defaults :resource_class => CategoryNews, :collection_name => 'category_news', :instance_name => 'category_news'

  def index
    @category_news = CategoryNews.page(params[:page])  
  end
end