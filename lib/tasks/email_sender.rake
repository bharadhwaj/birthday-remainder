desc "Send email to users"

task :email_sender => :environment do
	# ActiveRecord::Base.establish_connection('development')
	User.users_with_birthday.each do |u|
		print "\n\n%%%%%%%%%%%Environment check: ---- #{Rails.env}\n\n"
		BirthdayMailer.send_birthday_mail(u).deliver
	end
end