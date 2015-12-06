module SitesHelper

  def site_style_tag
    css = [background_image_css, banner_image_css, display_font_css, body_font_css, @site.css].
      join("\n")
    return "" if css.blank?

    content_tag(:style, css.html_safe, id: "site-css")
  end

  def background_image_css
    return "" if @site.background_image_url.nil?

    "div#main { background-image: url(#{@site.background_image_url}); }"
  end

  def banner_image_css
    return "" if @site.banner_image_url.nil?

    "div#banner { background-image: url(#{@site.banner_image_url}); }"
  end

  def display_font_css
    ".display-font, .page-title, .btn-main, .flash-main { font-family: #{@site.display_font}; }"
  end

  def body_font_css
    "body, h1, h2, h3, h4, h5, h6 { font-family: #{@site.body_font}; }"
  end

end