class Post < ApplicationRecord
  belongs_to :user
  has_many :post_details, dependent: :destroy
  accepts_nested_attributes_for :post_details, allow_destroy: true
end
