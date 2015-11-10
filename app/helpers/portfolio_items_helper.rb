module PortfolioItemsHelper

  def print_color_palette(colors)
    color_string = ''
    colors.each do |c|
      color_string += content_tag :span, ' ', style: "display: block; float: left;  width: 35px; height: 35px; background: #{c.to_hex}"
    end
    content_tag :div, color_string.html_safe, style: "display: inline-block;"
  end
end
