class Post < ApplicationRecord
  # association
  belongs_to :user
  
  # validation
  validates :title, :post, :user_id, presence: true

  def your_post?(user)
    self.user_id == user.id
  end
end
