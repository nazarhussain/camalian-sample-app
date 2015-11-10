class PortfolioColor < ActiveRecord::Base
  belongs_to :color
  belongs_to :portfolio_item
end
