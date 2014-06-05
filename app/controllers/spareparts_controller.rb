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
