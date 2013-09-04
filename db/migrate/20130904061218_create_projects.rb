class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.string :name
      t.string :location
      t.date :start_date
      t.date :estimated_completion_date
      t.float :budget_amount
      t.float :spent_amount
      t.float :balance_amount
      t.float :completion_pct

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
