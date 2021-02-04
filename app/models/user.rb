class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_initialize :set_defaults, unless: :persisted?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :developers, dependent: :destroy
  validates :pseudo, uniqueness: true
  #acts_as_token_authenticatable
  def set_defaults
    self.admin  = false
    self.developer_confirm = false
    self.developer_request = false
    self.authentication_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(authentication_token: random_token)
    end
  end
end
