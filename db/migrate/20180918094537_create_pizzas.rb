class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :price
      t.float :
      t.string :url

      t.timestamps
    end
  end
end
