class Backend::PageContentsController < Backend::ApplicationController
  defaults :resource_class => PageContent, :collection_name => 'page_contents', :instance_name => 'page_contents'
  before_filter :prepare_select

  def index
    @page_contents = PageContent.page(params[:page])  
  end

  def prepare_select
 		@category_contents = [
 														['Slider','Slider'],
 														['Sidebar Contact','Sidebar Contact'],
 														['Sidebar Contact Map','Sidebar Contact Map'],
 														['Widget Find Us','Widget Find Us'],
 														['About Us','About Us'],
 														['Need Help','Need Help']
 													]
 	end
end