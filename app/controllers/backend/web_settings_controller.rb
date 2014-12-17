class Backend::WebSettingsController < Backend::ApplicationController
  defaults :resource_class => WebSetting, :collection_name => 'web_settings', :instance_name => 'web_settings'

  def index
    @web_settings = WebSetting.page(params[:page])  
  end

end