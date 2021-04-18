class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer  :user_id
      t.string   :task_name
      t.string   :task_descriptions
      t.integer  :status
      t.datetime :deadline
      t.timestamps
    end
  end
end
