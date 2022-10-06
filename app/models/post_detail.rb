class PostDetail < ApplicationRecord
  validate :required_either_genre_or_custom_genre
  validates :title, presence: true
  validates :price, presence: true

  belongs_to  :post
  belongs_to  :genre, optional: true

    private

  def required_either_genre_or_custom_genre

    return if genre_id.present? ^ custom_genre.present?

    errors.add(:base, 'ジャンルまたはカスタムジャンルのどちらか一方を入力してください')
  end
end
