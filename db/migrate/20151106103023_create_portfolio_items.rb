class CreatePortfolioItems < ActiveRecord::Migration
  def change
    create_table :portfolio_items do |t|
      t.attachment :image
      t.timestamps null: false
    end
  end
end
