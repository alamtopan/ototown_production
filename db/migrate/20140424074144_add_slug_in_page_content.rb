class AddSlugInPageContent < ActiveRecord::Migration
  def change
  	add_column :page_contents, :slug, :string
  end
end
