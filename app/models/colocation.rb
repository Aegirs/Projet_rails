class Colocation < ActiveRecord::Base
	
	validates :titre, presence: true
	validates :nbmaxcoloc, presence: true
	validates :adress, presence: true

	
end
