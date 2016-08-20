class Friend < ApplicationRecord
	belongs_to :user

	before_save {
		email.downcase!
	}

	before_save :set_default_values
		
	validates :name, presence: true, length: {maximum: 30}
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,	
				presence: true,
				length: {maximum: 100},
				format: { with: VALID_EMAIL_REGEX},
				uniqueness: { case_sensitive: false }

	def self.friends_with_birthday
		# mysql query to retrieve users with today as birthday
		# User.where("MONTH(dob) = ? and DAY(dob) = ?", Date.today.month, Date.today.day)

		#SQLite query to retrieve users with today as birthday
		Friend.where("cast(strftime('%m', dob) as int) = ? and cast(strftime('%d', dob) as int) = ?", Date.today.month, Date.today.day)
	end

	def set_default_values
		self.birthday_message = "Wish you a very happy birthday! Have a great year ahead!" if self.birthday_message.blank?
	end
end
