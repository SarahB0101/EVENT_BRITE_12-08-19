class Event < ApplicationRecord

	validates :start_date,
		presence: true,
		if :not_in_past?

	validates :duration, 
		presence: true,
		numericality: {greater_than: 0, only_integer: true}, if :multiple_of_5?

	validates :title,
		presence: true,
		length: { minimum: 140 }

	validates :description,
		presence: true,
		length: { in: 20..1000 }

	validates :price,
		presence: true,
		numericality: {only_integer: true, in: 1..1000}

	validates :location,
		presence: true	
			

	belongs_to :administrator, foreign_key: 'administrator_id', class_name: 'User'	

	has_many :attendances
	has_many :participants, through: :attendances, class_name: "User"






	def not_in_past
    	#self.start_date > Time.now
    	self.start_date < DateTime.now
    end


    def multiple_of_5
    	self.duration % 5 == 0
    end

  
end
