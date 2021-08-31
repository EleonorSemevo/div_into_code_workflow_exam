class Station < ApplicationRecord
  belongs_to :property, inverse_of: :stations
  validates_presence_of :property
end
