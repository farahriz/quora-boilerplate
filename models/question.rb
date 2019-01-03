class Question < ActiveRecord::Base
	belongs_to :user

	validates :user_id, prescence: true
	validates :title, prescence: true
	validates :content, prescence: true

end