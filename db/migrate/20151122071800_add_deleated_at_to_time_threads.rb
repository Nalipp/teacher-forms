class AddDeleatedAtToTimeThreads < ActiveRecord::Migration
  def change
    add_column :time_threads, :deleted_at, :datetime
    add_index :time_threads, :deleted_at
  end
end
