class Website < ApplicationRecord
  validates :schedule, presence: true, if: :active

  scope :active, -> { where(active: true) }

  after_commit { ScheduleUpdater.call }
end
