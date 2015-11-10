require 'camalian'

class PortfolioItem < ActiveRecord::Base
  has_attached_file :image,
                    styles: {medium: "300x300>", thumb: "100x100>"},
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  attr_accessor :color_count

  has_many :portfolio_colors, dependent: :destroy
  has_many :colors, through: :portfolio_colors

  after_save :extract_colors

  private
  def extract_colors
    image = Camalian::load(self.image.path)
    colors = image.prominent_colors(self.color_count.to_i).sort_similar_colors
    colors.each do |color|
      unless c = Color.where(r: color.r, g: color.g, b: color.b).first
        c = Color.create(r: color.r, g: color.g, b: color.b, h: color.h, s: color.s, l: color.l)
      end
      self.colors << c
    end
  end
end
