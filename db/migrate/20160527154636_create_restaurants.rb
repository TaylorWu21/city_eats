class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :food_type, null: false
      t.integer :cost_rating
      t.boolean :open, default: true
      t.boolean :take_out
      t.boolean :alcohol
      t.belongs_to :city

      t.timestamps null: false
    end
  end
end
