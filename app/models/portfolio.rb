class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies

  validates :title, :body, presence: true
  validates_presence_of :main_image, :thumb_image

  after_initialize :set_defaults

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :non_angular, -> { where.not(subtitle: 'Angular') }

  def set_defaults
    self.main_image   ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image  ||= Placeholder.image_generator(height: '300', width: '250')
  end

end
