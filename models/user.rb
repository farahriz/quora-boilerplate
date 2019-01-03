class User < ActiveRecord::Base
	has_secure_password

	validates :email, format: {with: /@.+\...+/}
	validates :email, uniqueness: true

	# def log_in(email, password) --> If we were putting password login logic here, it would live in a function something like this

end