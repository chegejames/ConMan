class CreateLabourEstimates < ActiveRecord::Migration
  def change
    create_table :labour_estimates do |t|
      t.references :project
      t.float :lowest_estimated_number_of_days
      t.float :highest_estimated_number_of_days
      t.float :actual_number_of_days
      t.integer :lowest_estimated_number_of_men
      t.integer :highest_estimated_number_of_men
      t.integer :actual_number_of_men
      t.float :lowest_estimated_cost_per_day
      t.float :highest_estimated_cost_per_day
      t.float :avg_cost_per_day
      t.float :lowest_estimated_total_cost
      t.float :highest_estimated_total_cost
      t.float :actual_total_cost

      t.timestamps
    end
    add_index :labour_estimates, :project_id
  end
end
