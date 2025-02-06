class StatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum status: { pending: 0, in_progress: 1, completed: 2, archived: 3 }

  validates :status, presence: true
end
