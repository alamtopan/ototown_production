class Backend::TypesController < Backend::ApplicationController
  defaults :resource_class => Type, :collection_name => 'types', :instance_name => 'type'

  def index
    @types = Type.page(params[:page])  
  end

end