class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body, :post
  # I would think :user needs to be attr_accessible as well?

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
