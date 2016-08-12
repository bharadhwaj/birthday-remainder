class BirthdayMailer < ApplicationMailer
	default from: 'birthdayremainder16@gmail.com'

	def send_birthday_mail(user)
		@user = user
		mail(to: 'mailmeatanil94@gmail.com', subject: 'Testing Email')
	end
end
