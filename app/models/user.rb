class User < ApplicationRecord
 has_one_attached :image 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # association
  has_many :posts

  # validation
  validates :nickname, presence: true, length: { maximum: 6 }

  def your_account?(user)
    self.id == user.id
  end
  
  def image_have?
    return self.image.attached?
  end
end
