class PublicsController < ApplicationController
	before_action :generate_select, only: [:home,:search,:search_sparepart]

	def home
		@news_list = News.limit(1)
		@cars = Car.published.limit(20).order('created_at DESC')
		@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").order("dealer_infos.id DESC").limit(3)
		@spareparts = Sparepart.limit(20).order('created_at DESC')
    @cars_count = Car.published
		render layout: 'application_home'
	end

	def news
		@news = News.includes(:category_news).where("category_news.title = 'News'").published.page(params[:page]).per(4)
		render layout: 'application_news'
	end

	def tips
		@news = News.includes(:category_news).where("category_news.title = 'Tips'").published.page(params[:page]).per(4)
		render layout: 'application_news'
	end

	def detail_news
		@news = News.where(slug: params[:id]).first
		@news_list = News.limit(10)
		render layout: 'application_news_detail'
	end

	def page
		@page = PageContent.where(slug: params[:id]).first
		render layout: 'application_page_detail'
	end

	def brand_model
    render inline: "<%= select_tag :team_id, options_for_select(Model.where(brand_name: params[:brand]).map{|brand| [brand.name, brand.name] }), { prompt: 'Please Select',class: 'form-control', id: 'model_product' } %>"
	end

  def search
    search_params=params[:search]
    @cars = Car.published.filter_search(search_params).page(params[:page])
    render layout: 'application_catalog'
  end

  def search_sparepart
    search_params=params[:search]
    @spareparts = Sparepart.published.filter_search(search_params).page(params[:page])
    render layout: 'application_catalog'
  end

  def compare
    unless cookies[:compare_products].nil?
      unless cookies[:compare_products].include?(params[:id])
        cookies[:compare_products] = cookies[:compare_products].split() << params[:id]
      end
    else
      cookies[:compare_products] = params[:id]
    end
    flash[:notice] = "Product Has add to Compare"
    redirect_to compare_products_path
  end

  def compare_products
    slugs = cookies[:compare_products] ? cookies[:compare_products].split('&') : []
    @products = Car.published.where("slug IN (?)", slugs)
    render layout: 'application_compare'
  end

  def delete_compare
    cookies.delete :compare_products
    flash[:notice] = "Compared Product Has already to delete"
    redirect_to root_path
  end

	private

	  def generate_select
      @models = Model.all.map{|m| [m.name, m.name]}
      @types = Type.all.map{|t| [t.name, t.name]}
      @brands = Brand.all.map{|t| [t.name, t.name]}
      @years_min = (1945..Time.new.year).to_a.map{|y| [y, y]}
      @years_max = (1946..Time.new.year).to_a.map{|y| [y, y]}
      colors = ['Black','Red','White','Blue','Silver','Pink','Gray','Metalic','Silver Stone','Green',
        'Yellow','Purple','Maroon']
      @colors = colors.map{|c| [c,c]}
      @transmissions = ['M/T Manual','A/T Automatic','A/T Tiptronic'].map{|tr| [tr,tr]}
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
