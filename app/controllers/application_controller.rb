class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :footer_content
  before_filter :advertisements
  before_filter :select_search_filter

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
  end

  def after_sign_in_path_for(resource)
    if current_user
      user_home_path
    elsif current_backend_admin
      backend_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  protected

    def footer_content
      @about = PageContent.where("category =?", "About Us")
      @need_help = PageContent.where("category =?", "Need Help")
      @slider = PageContent.where("category =?", "Slider")
      @sidebar_contact = PageContent.where("category =?", "Sidebar Contact").first
      @sidebar_contact_map = PageContent.where("category =?", "Sidebar Contact Map").first
      @web = WebSetting.first
    end

    def advertisements
      @news_home = News.includes(:category_news).where("category_news.title = 'News'").published.limit(3)
      @advertisement_home_side_left = Advertisement.published.where("position =?","Home Side Left").first
      @advertisement_home_side_right = Advertisement.published.where("position =?","Home Side Right").first
      @advertisement_home_sidebar_right = Advertisement.published.where("position =?","Home Sidebar Right")
      @advertisement_catalog_side_left = Advertisement.published.where("position =?","Catalog Side Left").first
      @advertisement_catalog_side_right = Advertisement.published.where("position =?","Catalog Side Right").first
      @advertisement_detail_car_side_left = Advertisement.published.where("position =?","Detail Car Side Left").first
      @advertisement_detail_car_side_right = Advertisement.published.where("position =?","Detail Car Side Right").first
      @advertisement_detail_news_side_left = Advertisement.published.where("position =?","Detail News Side Left").first
      @advertisement_detail_news_side_right = Advertisement.published.where("position =?","Detail News Side Right").first
      @advertisement_news_side_right_without_des = Advertisement.published.where("position =?","News Sidebar Right Without Information")
      @advertisement_news_side_right_with_des = Advertisement.published.where("position =?","News Sidebar Right With Information").first
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

    def select_search_filter
      @years_min = (1945..Time.new.year).to_a.sort.reverse.map{|y| [y, y]}
      @years_max = (1946..Time.new.year).to_a.sort.reverse.map{|y| [y, y]}
      @prices_min = [['0','0'],
                    ['25.000.000','25000000'],
                    ['50.000.000','50000000'],
                    ['75.000.000','75000000'],
                    ['100.000.000','100000000'],
                    ['125.000.000','125000000'],
                    ['150.000.000','150000000'],
                    ['175.000.000','175000000'],
                    ['200.000.000','200000000'],
                    ['250.000.000','250000000'],
                    ['300.000.000','300000000'],
                    ['350.000.000','350000000'],
                    ['400.000.000','400000000'],
                    ['450.000.000','450000000'],
                    ['500.000.000','500000000'],
                    ['750.000.000','750000000'],
                    ['1.000.000.000','1000000000']]

      @prices_max = [['25.000.000','25000000'],
                    ['50.000.000','50000000'],
                    ['75.000.000','75000000'],
                    ['100.000.000','100000000'],
                    ['125.000.000','125000000'],
                    ['150.000.000','150000000'],
                    ['175.000.000','175000000'],
                    ['200.000.000','200000000'],
                    ['250.000.000','250000000'],
                    ['300.000.000','300000000'],
                    ['350.000.000','350000000'],
                    ['400.000.000','400000000'],
                    ['450.000.000','450000000'],
                    ['500.000.000','500000000'],
                    ['750.000.000','750000000'],
                    ['1.000.000.000','1000000000'],
                    ['> 1.000.000.000',10]]
    end

end
