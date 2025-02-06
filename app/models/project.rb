class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  validates :name, presence: true

  def status
    status_changes.last&.status || StatusChange.statuses.keys.first
  end
end
