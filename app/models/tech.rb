class Tech < ActiveRecord::Base
  attr_accessible :title, :link, :image
  has_attached_file :image, :styles => { :large => "200x200>", :thumb => "100x100>" }
end
