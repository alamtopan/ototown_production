class AddSlugInNews < ActiveRecord::Migration
  def change
  	add_column :news, :slug, :string
  end
end
