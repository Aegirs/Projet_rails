class Photo < ActiveRecord::Base
  belongs_to :colocation
  do_not_validate_attachment_file_type :image
  
  attr_accessor :must_be_deleted
  
  has_attached_file :image,
     :styles => { 
		:medium => "200x200>", 
		:thumb => "100x100>" 
		}, :default_url => "/images/:style/missing.png"	
  validates_attachment_size :image, :less_than => 2.megabytes
end
