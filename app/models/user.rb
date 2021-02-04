class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_initialize :set_defaults, unless: :persisted?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :developers, dependent: :destroy
  validates :pseudo, uniqueness: true

  def set_defaults
    self.admin  = false
    self.developer_confirm = false
    self.developer_request = false
  end
end
