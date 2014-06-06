class ChangeTypePriceToInteger < ActiveRecord::Migration
  def self.up
    change_column :products, :price, 'integer USING CAST(year AS integer)'
  end

  def self.down
    change_column :products, :price, :string
  end
end
