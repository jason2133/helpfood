class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.boolean :notice, default: false
            
      t.timestamps
    end
  end
end
