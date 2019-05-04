class Portfolio < ApplicationRecord

  validates :title, :body, presence: true
  validates_presence_of :main_image, :thumb_image

end
