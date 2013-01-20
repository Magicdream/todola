class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.string :state, null: false
      
      t.integer :priority
      t.datetime :due_date

      t.timestamps
    end

    add_index :tasks, :user_id
    # for sorting
    add_index :tasks, [:user_id, :priority]
    add_index :tasks, [:user_id, :due_date]
  end
end
