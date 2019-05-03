class User < ApplicationRecord
 has_one_attached :image 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # association
  has_many :posts
  
  def your_account?(user)
    self.id == user.id
  end
end
