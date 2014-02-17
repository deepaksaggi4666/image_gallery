class Photo < ActiveRecord::Base
has_many :comments, dependent: :destroy
accepts_nested_attributes_for :comments
belongs_to :album
has_many :users, :through => :comments
has_attached_file :image, { 

    :styles => { 

      :thumb => ["50x50#", :jpg], 

      :medium => ["100x100#", :jpg], 

      :large => ["600x600>", :jpg] 

    }, 
 
    :convert_options => { 

      :thumb => "-gravity Center -crop 50x50+0+0", 

      :thumb => "-gravity Center -crop 100x100+0+0", 

    } 

  } 
end
