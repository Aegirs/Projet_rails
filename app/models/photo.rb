class Photo < ActiveRecord::Base
  belongs_to :colocation,:polymorphic => true
  do_not_validate_attachment_file_type :image
  has_attached_file :image,
     :styles => { 
		:medium => "200x200>", 
		:thumb => "100x100>" 
		}, :default_url => "/images/:style/missing.png"	
end
