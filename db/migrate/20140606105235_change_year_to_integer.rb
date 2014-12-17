class ChangeYearToInteger < ActiveRecord::Migration
  def self.up
    change_column :products, :year, 'integer USING CAST(year AS integer)'
  end

  def self.down
    change_column :products, :year, :string
  end
end
