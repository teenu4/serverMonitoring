class RefactorFrequency < ActiveRecord::Migration[7.0]
  def change
    remove_column :websites, :frequency
    add_column :websites, :schedule, :string
  end
end
