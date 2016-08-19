class AddBirthdayMessageToFriends < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :birthday_message, :string, :default => "Wish you many many happy returns of the day.!"
  end
end
