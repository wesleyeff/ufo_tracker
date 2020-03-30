class Hotspot < ApplicationRecord
  has_and_belongs_to_many :sightings
end
