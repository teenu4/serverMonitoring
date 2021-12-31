class AddMinIntervalToWebsites < ActiveRecord::Migration[7.0]
  def change
    add_column :websites, :min_interval, :integer, default: 0
  end
end
