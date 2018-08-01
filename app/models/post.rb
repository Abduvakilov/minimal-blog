class Post < ApplicationRecord

	default_scope { order 'created_at desc' }

	belongs_to :user
  has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { minimum: 4 }
	validates :body,  presence: true, length: { minimum: 31, maximum: 4095 }
                
end
