class Website < ApplicationRecord
  validates :schedule, presence: true, if: :active
  validates :min_interval, numericality: { greater_than_or_equal_to: 0 }

  scope :active, -> { where(active: true) }

  after_commit { ScheduleUpdater.call if should_update_schedule? }

  private

    def should_update_schedule?
      Sidekiq::Scheduler.enabled && (active_previously_changed? || schedule_previously_changed?)
    end
end
