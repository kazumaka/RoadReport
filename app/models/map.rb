class Map < ApplicationRecord
  belongs_to :post, dependent: :destroy
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

end
