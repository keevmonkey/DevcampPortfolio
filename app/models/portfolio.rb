class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies, dependent: :destroy
  # configure model to accept nested data for technology model
  # afterwhich, sets basic first validation to reject if attars['name'] is blank
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates :title, :body, presence: true
  validates_presence_of :main_image, :thumb_image

  scope :non_angular, -> { where.not(subtitle: 'Angular') }

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end

  after_initialize :set_defaults

  def set_defaults
    self.main_image   ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image  ||= Placeholder.image_generator(height: '300', width: '250')
  end

end
