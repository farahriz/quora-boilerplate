class User < ActiveRecord::Base
	validates :email, format: {with: /@.+\...+/}
	validates :email, uniqueness: true
	validates :phone, length: {minimum: 8}

end