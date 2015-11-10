class CreatePortfolioColors < ActiveRecord::Migration
  def change
    create_table :portfolio_colors do |t|
      t.references :portfolio_item
      t.references :color
    end
  end
end
