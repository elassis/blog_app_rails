class AddLikesCounterToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likes_counter, :decimal
  end
end