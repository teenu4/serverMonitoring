class CreateNotifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :notifiers do |t|
      t.string :platform
      t.json :credentials
      t.boolean :active, default: false
      t.references :website

      t.timestamps
    end
  end
end
