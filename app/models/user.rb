class User < ActiveRecord::Base
  has_many :posts, dependent: :nullify

  has_many :comments, dependent: :nullify
  has_many :commented_posts, through: :posts, source: :post


  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name_display
    if first_name || last_name
      "#{first_name} #{last_name}".strip.squeeze(" ")
    else
      email
    end
  end
  
end
