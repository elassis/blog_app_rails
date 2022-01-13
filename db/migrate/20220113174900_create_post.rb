class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, &:timestamps
  end
end
