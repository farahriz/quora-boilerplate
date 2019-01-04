class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :votes

	validates :title, :content, :user_id, presence: true

end