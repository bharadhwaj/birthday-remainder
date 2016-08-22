# Preview all emails at http://localhost:3000/rails/mailers/birthday_mailer
class BirthdayMailerPreview < ActionMailer::Preview
	def sample_email_preview
		BirthdayMailer.send_birthday_mail(Friend.last)
	end
end
