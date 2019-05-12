class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }
  validates_presence_of :title, :body
  belongs_to :topic
  after_initialize :set_defaults

  def set_defaults
    self.topic ||= Topic.first 
  end
end
