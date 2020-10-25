class Cafe < ApplicationRecord
	belongs_to :user

	has_many :cafe_tags, dependent: :destroy
    has_many :tags, through: :cafe_tags
    has_many :cafe_comments, dependent: :destroy

    geocoded_by :address
  	after_validation :geocode, if: :address_changed?
  	# モデル登録時と住所(address)変更時にgeocoderが動いて緯度・経度のデータが登録・更新される

  	validates :shop_name, presence: true
  	validates :impression, presence: true


end
