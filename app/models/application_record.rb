class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def image_format
    return unless image.attached?
    return if image.blob.content_type.start_with? 'image/'

    image.purge_later
    errors.add(:image, I18n.t('activerecord.errors.models.notice.attributes.image.format'))
  end

end
