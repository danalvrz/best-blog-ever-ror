class User < ApplicationRecord
  has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  ROLES = %w[admin default].freeze

  after_initialize :set_default_role, if: :new_record?

  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  validates :name, presence: true, length: { minimum: 3 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def set_default_role
    self.role ||= :user
  end
end
