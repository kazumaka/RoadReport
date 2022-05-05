class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :map,dependent: :destroy
  has_many :post_comments, dependent: :destroy
  accepts_nested_attributes_for :map
end
