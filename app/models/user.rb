class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :cafes, dependent: :destroy
  attachment :profile_image
  has_many :cafe_comments, dependent: :destroy

  
  validates :nickname, presence: true

end
