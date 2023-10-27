class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.integer :post_counter
      t.timestamps
    end
  end
end
