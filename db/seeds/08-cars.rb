module SeedCar
  
  def self.seed
    url = 'http://ototown.com/detail_car/crv-2-4-55b03325-8988-439f-8ae4-97d45841f7ba'
    resp = RestClient.get URI.escape(url)
    @doc  = Nokogiri::HTML(resp.body)
    (1..30).to_a.each do |i|
      puts "Data -#{i}"
      content = @doc.css('.car_characteristics')  
      params  = {
                  name: @doc.css('h1').text.strip.gsub(/\t/, '')+"-#{i}",
                  type_product: '',
                  condition: 'New',
                  brand: 'Honda',
                  model: 'CRV', 
                  color: 'Red',
                  year:  2015,
                  plate_number: 'KBJ 9099 IU',
                  exp_date: '1/12/2014'.to_date,
                  kilometer: 5000,
                  door: 6,
                  seat: 6,
                  transmission: 'Manual',
                  engine: '2000',
                  cylinders: 4,
                  fuel: 'Premium',
                  location: 'Jakarta Selatan',
                  price: 15000000,
                  user_id: User.all.shuffle.first.id,
                  status: true
                }  
      car = Car.where(name: params[:name]).first
      if car.present?
        car.update_attributes(params)
        puts 'success updated'
      else
        car = Car.new(params)
        if car.save
          puts 'success saved' 
        else
          puts 'failed save'
        end
      end
      car = Car.where(name: params[:name]).first
      items = @doc.css('.carousel-inner2 .item')
      items.each do |item|
        images = {
          image: URI.parse(item.css('img').attribute('src').value),
          product_id: car.id
        }
        image_product = ImageProduct.new(images)
        if image_product.save
          puts "\timage saved"
        else
          puts "\timage fail to save"
        end
      end
    end
  end

end