class Post < ActiveRecord::Base
  attr_accessible :title, :body, :image
  has_attached_file :image, :styles => { :large => "300x300>", :thumb => "150x150>" }
  
  def as_json(options={})
    hash = super(options)
    hash.merge!(
                'image_thumb_url' => image.url(:thumb),
                'image_large_url' => image.url(:large)
                )
    hash
  end
end
