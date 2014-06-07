class SparepartsController < ApplicationController
	before_filter :generate_select, except: [:index,:show]

	def spareparts
		@spareparts = Sparepart.published.page(params[:page]).per(6).order("id DESC")
		render layout: 'application_catalog'
	end

	def detail_sparepart
		@sparepart = Sparepart.published.find_by(slug: params[:id])
		impressionist(@sparepart)
		render layout: 'application_car_detail'
	end

	private
		def generate_select
      @types = Type.all.map{|t| [t.name, t.name]}
      @brands = Brand.all.map{|t| [t.name, t.name]}
      colors = ['Black','Red','White','Blue','Silver','Pink','Gray','Metalic','Silver Stone','Green',
        'Yellow','Purple','Maroon']
      @colors = colors.map{|c| [c,c]}
      @transmissions = ['M/T Manual','A/T Automatic','A/T Tiptronic'].map{|tr| [tr,tr]}
    end

end
