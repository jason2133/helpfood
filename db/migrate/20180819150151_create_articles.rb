class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :articleimage
      t.belongs_to :user, foreign_key: true
      t.boolean :notice, default: false

      t.timestamps
    end
  end
end
