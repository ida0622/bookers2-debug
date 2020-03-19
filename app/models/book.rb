class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, length: { in: 1..40 }
	validates :body, presence: true, length: { in: 0..200 }
end
