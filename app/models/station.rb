class Station < ApplicationRecord
  belongs_to :property
  validates_presence_of :property
end
