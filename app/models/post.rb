class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :spot,dependent: :destroy
  accepts_nested_attributes_for :spot
end
