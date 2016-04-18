class AddFkToFriends < ActiveRecord::Migration
  def change
  	add_foreign_key :friends, :users, column: :user_id
    add_foreign_key :friends, :users, column: :new_friend
  end
end
