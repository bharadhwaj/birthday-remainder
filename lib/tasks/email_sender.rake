desc "Send email to users"

task :email_sender => :environment do
	User.users_with_birthday.each do |u|
		BirthdayMailer.send_birthday_mail(u).deliver
	end
end