class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :note
      t.string :video
      t.boolean :header, :null => false, :default => false
      t.string :tag
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
