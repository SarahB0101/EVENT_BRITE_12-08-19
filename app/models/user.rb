class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	has_many :administrated_events, foreign_key: 'administrator_id', class_name: "Event"

	has_many :attendances, foreign_key: 'participant_id' #vu de la table attendances user = participant_id
	#has_many :participants, foreign_key: :administrated_events, class_name: 'User'
	has_many :events, through: :attendances
	

	
	after_create :send_welcome

	def send_welcome
		UserMailer.welcome_email(self).deliver_now
	end

	def name
  		return "#{first_name} #{last_name}"
  	end
end
