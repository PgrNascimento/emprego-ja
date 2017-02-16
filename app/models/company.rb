class Company < ApplicationRecord
  has_many :jobs
  def premium?
    self.jobs.count >= 5
  end
end
