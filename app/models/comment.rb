class Comment < ActiveRecord::Base

  belongs_to :post

  validates :body, presence: { message: "Cannot submit this comment because it is blank." }
  validates :body, uniqueness: { message: "Cannot submit this comment because it duplicates an existing one" }

end
