class Portfolio < ApplicationRecord
  validates :title, :body, presence: true
  validates_presence_of :main_image, :thumb_image

  after_initialize :set_defaults

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :non_angular, -> { where.not(subtitle: 'Angular') }

  def set_defaults
    self.main_image   ||= "https://via.placeholder.com/600x400"
    self.thumb_image  ||= "https://via.placeholder.com/300x250"  
  end

end
