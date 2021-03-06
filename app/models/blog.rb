class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }
  validates_presence_of :title, :body, :topic_id
  belongs_to :topic
  has_many :comments, dependent: :destroy

  after_initialize :set_defaults
  
  scope :rails_topic, -> { where(topic_id: Topic.where(title: "Rails")) }
  scope :health_topic, -> { where(topic_id: Topic.where(title: "Health")) }
  scope :projects_topic, -> { where(topic_id: Topic.where(title: "Projects")) }

  def self.recent
    order('created_at DESC')
  end

  def set_defaults
    self.topic ||= Topic.first 
  end
end
