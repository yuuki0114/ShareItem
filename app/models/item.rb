class Item < ApplicationRecord
  with_options presence: true do
    validates :name,          null: false
    validates :detail,        null: false
    validates :image,         null: false
    validates :rental_period, null: false
    validates :price,         null: false
  end

  mount_uploader :image, ImageUploader 

  belongs_to :user
end