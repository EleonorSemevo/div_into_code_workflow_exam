class NearbyStation < ApplicationRecord
  belongs_to :property
  belongs_to :station
  has_many :stations
  has_many :properties
end
