class Category < ApplicationRecord
  has_many :jobs
    validates :name, presence: true, uniqueness: {message: "Categoria já existente" }
end
