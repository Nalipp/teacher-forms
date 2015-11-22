class CreateTimePosts < ActiveRecord::Migration
  def change
    create_table :time_posts do |t|
      t.integer :time_thread_id
      t.integer :user_id
      t.integer :month
      t.integer :day
      t.integer :minute

      t.timestamps null: false
    end
  end
end
