class PortfolioSearchForm
  include ActiveModel::Model
  attr_accessor :color, :similarity
  validates_presence_of :color, :similarity

  def color_object
    @color_object ||= Camalian::Color.new(self.color)
  end

  def color_range(color, level)
    (color_object.send(color) - level)..(color_object.send(color) + level)
  end

  def colors_by_rgb
    level = self.similarity.to_i * 255 / 100.0
    Color.where(r: color_range(:r, level), g: color_range(:g, level), b: color_range(:b, level))
  end

  def colors_by_hsl
    level = self.similarity.to_i
    Color.where(h: color_range(:h, (self.similarity.to_i * 30 / 100.0) ), s: color_range(:s, level), l: color_range(:l, level))
  end
end