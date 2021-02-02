class Project < ApplicationRecord

    
    validates :name, :description, :budget, presence: true
    validates :budget, numericality: { only_integer: true, greater_than: 0 }, allow_blank: false

end
