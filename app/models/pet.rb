class Pet < ApplicationRecord
  validates :pet_type, inclusion: { in: %w[Cat Dog] }
  validates :tracker_type, presence: true
  validates :owner_id, presence: true
  validates :in_zone, inclusion: { in: [true, false] }
end