class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :first_name
    t.string :last_name
    t.string :phone_number
    t.string :address
    t.string :unit
    t.string :city
    t.string :state
    t.integer :zip_code
    t.string :entry_code
    t.string :email
    t.date :birthday
    t.string :profile_picture
    end
  end
end
