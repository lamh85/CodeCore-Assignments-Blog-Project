class Tag < ActiveRecord::Base

  # Declare relationship with the Tagging model
  has_many :taggings, dependent: :nullify
  # Create a method for .post
  has_many :posts, through: :tagging, source: :post

end
