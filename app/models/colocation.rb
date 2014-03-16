class Colocation < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	
	validates :titre, presence: true
	validates :nbmaxcoloc, presence: true
	validates :adress, presence: true

	geocoded_by :adress
	after_validation :geocode, :if => :adress_changed?
  
end
