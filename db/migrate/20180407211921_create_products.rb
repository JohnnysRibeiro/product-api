class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :height
      t.float :width
      t.float :lenght
      t.float :weight
      t.float :price

      t.timestamps
    end
  end
end
