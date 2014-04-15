class ChangeActiveStringToBoolean < ActiveRecord::Migration
  def up
   change_column :advertisements, :active, :boolean
  end
end
