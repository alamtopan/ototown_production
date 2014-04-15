class AddActiveInAdvertisement < ActiveRecord::Migration
  def change
  	add_column :advertisements, :active, :boolean
  end
end
