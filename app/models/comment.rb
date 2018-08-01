class Comment < ApplicationRecord
	validates_presence_of :body, :user
	belongs_to :user
  belongs_to :post
end
