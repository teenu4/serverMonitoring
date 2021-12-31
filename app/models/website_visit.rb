class WebsiteVisit < ApplicationRecord
  belongs_to :website
  validates :status_code, numericality: { greater_than_or_equal_to: 0 }
end
