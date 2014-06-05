class ChangeColumnPriceStringToInteger < ActiveRecord::Migration
  def up
    change_column :products, :price,  :integer, limit: 11
  end

  def down
    change_column :products, :price,  :string
  end
end
