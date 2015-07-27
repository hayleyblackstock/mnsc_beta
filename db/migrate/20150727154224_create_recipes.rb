class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.integer :type
    end
  end
end
