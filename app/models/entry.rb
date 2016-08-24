class Entry < ApplicationRecord
  validates :for_date, presence: true
  belongs_to :habit
end
