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

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown text
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
  
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
