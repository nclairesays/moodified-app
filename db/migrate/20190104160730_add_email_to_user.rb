class AddEmailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :email_address
  end
end
