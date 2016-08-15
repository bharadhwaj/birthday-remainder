module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Birthday Reminder"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def flash_message type, message
		flash[type] ||= []
		flash[type] << message
	end

	def flash_message_now type, message
		flash.now[type] ||= []
		flash.now[type] << message
	end

	def render_flash
		flash_array = []
		flash.each do |message_type, messages|
			if messages.kind_of?(Array)
				messages.each do |message|
					flash_array << render(partial: 'shared/flash', locals: {:message_type => message_type, :message => message})
				end
			end
		end
		flash_array.join('').html_safe
	end
end
