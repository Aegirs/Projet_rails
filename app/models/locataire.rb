class Locataire < ActiveRecord::Base
	belongs_to :colocation
	accepts_nested_attributes_for :colocation
end
