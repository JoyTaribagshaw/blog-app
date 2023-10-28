class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes, &:timestamps
  end
end
