class Answer < ActiveRecord::Base
	belongs_to :pin
	belongs_to :user
	validates :description, presence: true
end
