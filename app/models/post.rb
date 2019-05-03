class Post < ApplicationRecord
  # association
  belongs_to :user
  
  def your_post?(user)
    self.user_id == user.id
  end
end
