class Comment < ActiveRecord::Base

  belongs_to :post

  validates :body, presence: true
  validates :body, uniqueness: true

end
