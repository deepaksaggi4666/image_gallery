class Album < ActiveRecord::Base
has_many :photos
belongs_to :user
validates :title, :description, :presence => true
end
