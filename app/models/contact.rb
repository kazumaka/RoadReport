class Contact < ApplicationRecord
  validates :contact_name, presence: true
  validates :content, presence: true
end
