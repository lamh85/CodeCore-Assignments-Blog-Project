class Post < ActiveRecord::Base

  has_many :comments, dependent: :nullify
  has_many :commented_users, through: :users, source: :user

  belongs_to :user

  # title is unique and required

  validates :title, presence: { message: "Your title is blank. Please provide one." }
  validates :title, uniqueness: { message: "There is already a title like this. Please provide a different one." }

  has_many :favourites, dependent: :destroy
  # Create a method: .favourited_users
  has_many :favourited_users, through: :favourites, source: :user

  # To declare relationship between the two models
  has_many :taggings, dependent: :nullify
  # To create a method
  has_many :tags, through: :taggings, source: :tag

end
