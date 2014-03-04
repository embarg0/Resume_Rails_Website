module SessionsHelper

	def admin?
		if current_user.nil?
			false
		else
			current_user.is_role_by_name?("admin")
		end
	end

# Everything in these helpers is included everywhere except controllers
end
