class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :population
      t.string :year_est

      t.timestamps null: false
    end
  end
end
