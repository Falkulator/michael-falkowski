class Work < ActiveRecord::Base
  attr_accessible :body, :image, :link, :title
  has_attached_file :image, :styles => { :large => "400x400>", :thumb => "100x100>" }
end
