class Notice < ApplicationRecord

  has_one_attached :image

  validates :title, presence: true
  validates :title, length: { minimum: 6 }
  validates :context, presence: true
  validates :context, length: { minimum: 50 }
  validate :image_format

  private

  def image_format
    return unless image.attached?
    return if image.blob.content_type.start_with? 'image/'

    image.purge_later
    errors.add(:image, I18n.t('activerecord.errors.models.notice.attributes.image.format'))
  end

end
