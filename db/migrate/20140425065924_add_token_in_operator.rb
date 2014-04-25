class AddTokenInOperator < ActiveRecord::Migration
  def change
  	add_column :operators, :oauth_token, :string
  	add_column :operators, :oauth_expires_at, :datetime
  end
end
