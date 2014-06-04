class CarsController < ApplicationController
  before_filter :generate_select, except: [:index,:show]

	def cars
		condition = params[:condition]

		@cars = Car.published.where(condition: condition).page(params[:page]).per(6).order("id DESC")
		render layout: 'application_catalog'
	end

	def detail_car
		@car = Car.published.find_by(slug: params[:id])
		impressionist(@car)
		render layout: 'application_car_detail'
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
      @prices_min = [['0','0'],['10.000.000','10000000'],['50.000.000','50000000'],['100.000.000','100000000'],['200.000.000','200000000'],
        ['300.000.000','300000000']]
      @prices_max = [['10.000.000','10000000'],['50.000.000','50000000'],['500.000.000','500000000'],['800.000.000','800000000'],
        ['1000.000.000','1000000000']]
    end

end
