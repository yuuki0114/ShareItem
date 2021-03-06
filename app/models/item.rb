class Item < ApplicationRecord
  # 空の場合保存させない
  with_options presence: true do
    validates :name,           null: false
    validates :detail,         null: false
    validates :image,          null: false
    validates :rental_start,   null: false
    validates :rental_end,     null: false
    validates :price,          null: false
    validates :postcode,       null: false
    validates :address_region, null: false
    validates :trading_status, null: false
  end

  # 字数制限
  validates :name, length: { maximum: 30 }
  validates :detail, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader 

  belongs_to :user
  has_many :comments

  # 検索用メソッドの定義
  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end