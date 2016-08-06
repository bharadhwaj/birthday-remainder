class BirthdayMailer < ApplicationMailer
	default from: 'example.com'

	def send_birthday_mail(user)
		@user = user
		mail(to: @user.email, subject: 'Testing Email')
	end
end
