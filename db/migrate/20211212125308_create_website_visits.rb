class CreateWebsiteVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :website_visits do |t|
      t.references :website
      t.integer :status_code

      t.timestamps
    end
  end
end
