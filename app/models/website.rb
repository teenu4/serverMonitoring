class Website < ApplicationRecord
  validates :frequency, numericality: { greater_than: 0 }, if: :active

  scope :active, -> { where(active: true) }
end
