class Post < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  belongs_to :user

  # title is unique and required

  validates :title, presence: { message: "Your title is blank. Please provide one." }
  validates :title, uniqueness: { message: "There is already a title like this. Please provide a different one." }

end
