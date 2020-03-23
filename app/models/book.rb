class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments,dependent: :destroy
	has_many :favorites, dependent: :destroy
	validates :title, presence: true, length: { in: 1..40 }
	validates :body, presence: true, length: { in: 0..200 }
	 def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
end
