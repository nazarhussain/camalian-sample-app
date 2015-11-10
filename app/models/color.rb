class Color < ActiveRecord::Base
  has_many :portfolio_colors
  has_many :portfolio_items, through: :portfolio_colors

  def to_hex
    Camalian::Color.new(self.r, self.g, self.b).to_hex
  end
end
