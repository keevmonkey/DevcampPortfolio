module BlogTopicsConcern
  extend ActiveSupport::Concern

  included do
    before_action :list_blog_topics
  end

  def list_blog_topics
    @topics = Topic.all
  end
end