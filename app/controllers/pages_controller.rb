class PagesController < ApplicationController
#Rails convention allows to name these and have it follow to content of the same name
	def contact
		if request.post?
			#Send the email
			first_name = params['first_name']
			last_name = params['last_name']
			email = params['email']
			message = params['message']

			UserMailer.contact_confirmation(email, first_name, last_name, message).deliver
		
			#AdminMailer.visitor_contact().deliver
			@success = true
		end
	end

	def about
		
	end

	def interesting_facts
		
	end

end
