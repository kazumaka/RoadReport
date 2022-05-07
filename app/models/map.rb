class Map < ApplicationRecord
  belongs_to :post, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

end
