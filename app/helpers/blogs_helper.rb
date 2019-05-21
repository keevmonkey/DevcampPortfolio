module BlogsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end

  def blog_status_helper blog
    if logged_in?(:site_admin)
      if blog.draft?
        content_tag :span, 'Draft', class: "blog-status btn btn-sm btn-warning"
      else 
        content_tag :span, 'Published', class: "blog-status btn btn-sm btn-success"
      end
    end
  end
end
