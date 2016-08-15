class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.integer :user_id
      t.foreign_key :users
      t.timestamps
    end
  end
end
