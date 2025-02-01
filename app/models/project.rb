class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :status, inclusion: { in: ['Pending', 'In Progress', 'Completed'] }
end
