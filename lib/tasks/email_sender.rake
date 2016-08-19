desc "Send email to users"

task :email_sender => :environment do
	Friend.friends_with_birthday.each do |friend|
		BirthdayMailer.send_birthday_mail(friend).deliver
	end
end