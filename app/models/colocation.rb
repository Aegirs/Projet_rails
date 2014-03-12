class Colocation < ActiveRecord::Base
	
	validates :titre, presence: true
	validates :nbmaxcoloc, presence: true
	validates :adress, presence: true

	geocoded_by :adress
	after_validation :geocode, :if => :adress_changed?
  
end
