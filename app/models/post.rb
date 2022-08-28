class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_details, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :post_details, reject_if: :all_blank, allow_destroy: true
end
