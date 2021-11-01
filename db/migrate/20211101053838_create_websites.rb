class CreateWebsites < ActiveRecord::Migration[7.0]
  def change
    create_table :websites do |t|
      t.string :title
      t.string :url
      t.integer :frequency
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
