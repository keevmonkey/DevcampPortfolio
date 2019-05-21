module BlogsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end

  def blog_status_helper blog
    if blog.draft?
      content_tag :span, 'Draft', class: "blog-status"
    end
  end
end
