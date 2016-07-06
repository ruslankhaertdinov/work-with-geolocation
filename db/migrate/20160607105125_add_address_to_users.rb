class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country,   :string, null: false, default: ""
    add_column :users, :city,      :string, null: false, default: ""
    add_column :users, :address,   :string, null: false, default: ""
    add_column :users, :latitude,  :float
    add_column :users, :longitude, :float
  end
end
