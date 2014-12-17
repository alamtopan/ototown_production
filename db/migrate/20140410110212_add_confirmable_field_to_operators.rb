class AddConfirmableFieldToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :confirmation_token, :string
    add_column :operators, :confirmed_at, :datetime
    add_column :operators, :confirmation_sent_at, :datetime
    add_column :operators, :unconfirmed_email, :string
    add_index  :operators, :confirmation_token,   :unique => true

  end
end
