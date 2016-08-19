class BirthdayMailer < ApplicationMailer
	default from: 'birthdayremainder16@gmail.com'

	def send_birthday_mail(friend)
		@friend = friend
		mail(to: @friend.email, subject: 'Happy Birthday')
	end
end
