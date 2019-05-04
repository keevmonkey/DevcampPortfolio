class Portfolio < ApplicationRecord

  validates :title, :body, presence: true
  validates_presence_of :main_image, :thumb_image

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :non_angular, -> { where.not(subtitle: 'Angular') }
  
end
