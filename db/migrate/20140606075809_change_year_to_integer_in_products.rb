class ChangeYearToIntegerInProducts < ActiveRecord::Migration
  def change
  	change_column :products, :year, :integer
  end
end
