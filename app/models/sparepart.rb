class Sparepart < Product
  CATEGORY = 2
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :location, :city, :province, :images_attributes, :status_sold

  default_scope { where(category_id: CATEGORY) }

  scope :published, -> {where(status: true)}
  scope :filter_by_name, ->(name) do
            return if name.blank?
            where('name LIKE ?', "%#{name}%")
          end
  scope :filter_by_condition, ->(condition) do
            return if condition.blank?
            where(condition: condition) unless condition == 'All'
          end
  scope :filter_by_brand, ->(brand) do
            return if brand.blank?
            where(brand: brand)
          end
  scope :filter_by_model, ->(model) do
            return if model.blank?
            where(model: model)
          end
  scope :filter_by_year, ->(year) do
            return if year.blank?
            where(year: year)
          end
  scope :filter_by_type_product, ->(type_product) do
            return if type_product.blank?
            where(type_product: type_product)
          end
  scope :filter_by_province, ->(province) do
            return if province.blank?
            where(province: province)
          end
  scope :filter_by_city, ->(city) do
            return if city.blank?
            where(city: city)
          end
  scope :filter_by_price, ->(price1,price2) do
            return if price1.blank? && price2.blank?
            return where('price <= ? OR price >= ?', price2,price1) if price1.blank? || price2.blank?
            where('price <= ? AND price >= ?', price2,price1) if price1.present? && price2.present?
          end

  scope :filter_search, ->(params)  do
      return scoped if params.blank?

      filter_by_name(params[:name])
        .filter_by_condition(params[:condition])
        .filter_by_brand(params[:brand])
        .filter_by_model(params[:model])
        .filter_by_year(params[:year])
        .filter_by_type_product(params[:type_product])
        .filter_by_province(params[:province])
        .filter_by_city(params[:city])
        .filter_by_price(params[:price_from], params[:price_to])
  end

end
