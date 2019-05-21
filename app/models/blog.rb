class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }
  validates_presence_of :title, :body
  belongs_to :topic
  has_many :comments, dependent: :destroy

  after_initialize :set_defaults

  scope :first_blog, -> { first }
  scope :topic_one, -> { where(topic_id: 1).last }
  scope :topic_three, -> { where(topic_id: 3).last }

  def set_defaults
    self.topic ||= Topic.first 
  end
end
