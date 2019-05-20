class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  # configure model to accept nested data for technology model
  # afterwhich, sets basic first validation to reject if attars['name'] is blank
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates :title, :body, presence: true

  scope :non_angular, -> { where.not(subtitle: 'Angular') }

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end
end