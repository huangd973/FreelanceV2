class Developer < ApplicationRecord

    belongs_to :user
    has_many :projects
    validates :motivation, presence: true
  end