class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.references :project
      t.string :name
      t.date :estimated_start_date
      t.date :actual_start_date
      t.date :estimated_completion_date
      t.date :actual_completion_date
      t.float :lowest_estimated_cost
      t.float :highest_estimated_cost
      t.float :actual_cost
      t.float :completion_pct

      t.timestamps
    end
    add_index :phases, :project_id
  end
end
