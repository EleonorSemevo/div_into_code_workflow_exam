class Property < ApplicationRecord
  validates :name,presence: true
  validates :address, presence: true
  validates :rent, presence: true
  validates :age, presence: true
  validates :remark, presence: true

  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :all_blank

  # def reject_stations (attributes)
  #   attributes['railway'].blank?
  #   attributes['name'].blank?
  #   attributes['walk'].blank?
  # end

end
