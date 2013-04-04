class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :province_id
      t.string :firs_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :email

      t.timestamps
    end
  end
end
