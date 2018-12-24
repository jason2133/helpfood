class CreateNewAlarms < ActiveRecord::Migration[5.0]
  def change
    create_table :new_alarms do |t|
      t.string :content
      t.references :user
      t.string :link
      t.timestamps
    end
  end
end
