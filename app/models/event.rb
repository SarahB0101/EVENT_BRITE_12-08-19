class Event < ApplicationRecord

	validates :start_date, 
		presence: true

	validate :not_in_past

  validates :duration,
    presence: true,
    numericality: { only_integer: true, greater_than: 0}
 
  validate :multiple_of_5?

  validates :title, 
  	presence: true, 
  	length: { in: 5..140 }

  validates :description, 
  	presence: true, 
  	length: { in: 20..1000 }

  validates :price, 
  	presence: true,
  	numericality: { only_integer: true,  in: 1..1000}
  
  validates :location, presence: true
			

	belongs_to :administrator, class_name: 'User'	

	has_many :attendances
	has_many :participants, through: :attendances






	def not_in_past
		if self.start_date.present? && self.start_date < Time.now
       		errors.add(:start_date, "Ne peut être dans le passé")
    	end
    end


  def multiple_of_5?
  	#return self.duration % 5 == 0
  	if self.duration.present? && self.duration % 5 != 0
        errors.add(:duration, "doit être un multiple de 5")
    end
  end

  
end
