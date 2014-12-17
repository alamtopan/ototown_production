class AddStatusToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :status_sold, :string
  end
end
