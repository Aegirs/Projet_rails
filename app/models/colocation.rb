class Colocation < ActiveRecord::Base
	has_many :photos, dependent: :destroy
	has_many :locataires, dependent: :destroy
    accepts_nested_attributes_for :photos, :allow_destroy => true
    accepts_nested_attributes_for :locataires, :allow_destroy => true
	validates :titre, presence: true
	validates :nbmaxcoloc, presence: true
	validates :adress, presence: true
	geocoded_by :adress
	after_validation :geocode, :if => :adress_changed?
end
