class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps

    end
    add_index :subscriptions, [:course_id, :user_id], :unique => true
  end
end
