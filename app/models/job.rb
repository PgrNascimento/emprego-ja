class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category
  validates :title, :location, presence: true
  validates :description, presence: true
  validates :category, presence: true

end
