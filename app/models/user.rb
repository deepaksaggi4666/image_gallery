class User < ActiveRecord::Base
has_many :albums
has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         validates :user_name, :email, :password, presence: true
end
