class AddLastVisitToWebsites < ActiveRecord::Migration[7.0]
  def change
    add_column :websites, :last_visit, :datetime
  end
end
