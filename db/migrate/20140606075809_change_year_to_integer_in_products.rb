class ChangeYearToIntegerInProducts < ActiveRecord::Migration
  def change
  	change_column :products, :year, :integer
  	#change_column :products, :year, 'integer USING CAST(column_name AS integer)'
  end
end
