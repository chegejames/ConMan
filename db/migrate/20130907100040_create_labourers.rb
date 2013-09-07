class CreateLabourers < ActiveRecord::Migration
  def change
    create_table :labourers do |t|
      t.references :project
      t.string :title
      t.string :name
      t.float :lowest_estimated_number_of_days
      t.float :highest_estimated_number_of_days
      t.float :actual_number_of_days
      t.float :lowest_estimated_cost_per_day
      t.float :highest_estimated_cost_per_day
      t.float :avg_cost_per_day
      t.float :lowest_estimated_total_cost
      t.float :highest_estimated_total_cost
      t.float :actual_total_cost

      t.timestamps
    end
    add_index :labourers, :project_id
  end
end
