class Sighting < ApplicationRecord
  has_and_belongs_to_many :hotspots
end
