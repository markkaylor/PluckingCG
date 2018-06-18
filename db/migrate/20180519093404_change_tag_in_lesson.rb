class ChangeTagInLesson < ActiveRecord::Migration[5.1]
  def change
    change_column :lessons, :tag, "integer USING CAST(tag AS integer)"
  end
end
