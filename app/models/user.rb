class User < ApplicationRecord
	after_create :send_welcome

	has_many :administrated_events, foreign_key: 'administrator_id', class_name: "Event"

	has_many :attendances, foreign_key: 'participant_id'
	has_many :participants, foreign_key: :administrated_events, class_name: 'User'
	has_many :events, through: :attendances


	def send_welcome
		UserMailer.welcome_email(self).deliver_now
	end
end
