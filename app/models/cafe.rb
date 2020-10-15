class Cafe < ApplicationRecord
	belongs_to :user

	has_many :cafe_tags, dependent: :destroy
    has_many :tags, through: :cafe_tags
end
