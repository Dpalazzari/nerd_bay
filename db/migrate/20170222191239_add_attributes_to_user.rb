class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :integer
    add_column :users, :city, :string
    add_column :users, :token, :string
  end
end
