class Project < ApplicationRecord
    
    after_initialize :set_defaults, unless: :persisted?
    belongs_to :user
    belongs_to :categorie
    belongs_to :developer, optional: true
    validates :name, :description, :budget, presence: true
    validates :budget, numericality: { only_integer: true, greater_than: 0 }, allow_blank: false
    validates :phone, format: { with: /\d{10}/, message: "bad format" }

    def set_defaults
        self.statut  = false
        self.payed = false
    end
end
