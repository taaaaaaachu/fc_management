class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_details, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :post_details, reject_if: :all_blank, allow_destroy: true
  validate :post_details_present?

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def post_details_present?
    if !post_details.any?
      errors.add(:base, "固定費が入力されていません")
    end
  end
end